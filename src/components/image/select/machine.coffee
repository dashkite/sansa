import * as Fn from "@dashkite/joy/function"
import { Queue } from "@dashkite/joy/iterable"
import { Machine as $Machine, Async } from "@dashkite/talos"
import * as When from "./when"
import * as _Run from "./run"
import transitions from "./transitions"
import Dictionary from "#helpers/dictionary"

Run = Dictionary.plain _Run

run = ( action ) ->
  
  ( talos, event ) ->

    console.log run: talos.state

    await action talos, event

    if talos.context.navigate == true
      talos.context.updates.push Fn.tee ( state ) ->
        state.back.push talos.state
    else
      talos.context.navigate = true

    if talos.context.updates.length > 0
      talos.context.state.update ( Fn.pipe talos.context.updates )

    console.log context: talos.context
    talos.context.updates = []

machine = $Machine.make "sansa-image-select", do ->

  result = {}

  for state, targets of transitions

    result[ state ] = {}

    for transition in targets
      result[ state ][ transition ] =
        when: When[ transition ] ? When.generate transition
        run: run ( Run[ transition ] ? Run.generate transition )

    result[ state ].back =
      when: When.generate "back"
      move: ( talos, event ) ->
        _state = talos.state
        talos.state = talos.context.state.get().back.pop()
        talos.context.navigate = false
        talos.context.updates.push Fn.tee ( state ) ->
          state.back.pop()
          state.forward.push _state
        action = run ( Run[ talos.state ] ? Run.generate talos.state )
        action talos, name: talos.state, context: {}

    result[ state ].forward =
      when: When.generate "forward"
      move: ( talos, event ) ->
        _state = talos.state
        talos.state = talos.context.state.get().forward.pop()
        talos.context.navigate = false
        talos.context.updates.push Fn.tee ( state ) ->
          state.forward.pop()
          state.back.push _state
        action = run ( Run[ talos.state ] ? Run.generate talos.state )
        action talos, name: talos.state, context: {}

  console.log machine: result
  result

Machine =

  start: ( state ) ->

    queue = do Queue.make

    events = do ->
      loop
        event = await do queue.dequeue
        yield event

    context = { state, updates: [] }

    do ->

      for await talos from Async.start machine, context, events
        if talos.error?
          console.error talos.error
          console.warn { talos }
    queue.enqueue name: "home"
    queue

# TODO stack events so we can add back/forward
# back = ( talos ) ->
#   current = graph[ talos.state ]
#   talos.state = talos.context.stack.pop()
#   current[ talos.state ].run talos

export default Machine