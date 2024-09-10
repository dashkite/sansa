import { Queue } from "@dashkite/joy/iterable"
import { Machine as $Machine, Async } from "@dashkite/talos"
import * as When from "./when"
import * as _Run from "./run"
import transitions from "./transitions"
import Dictionary from "#helpers/dictionary"

Run = Dictionary.plain _Run

machine = $Machine.make "sansa-image-select", do ->
  result = {}
  for state, targets of transitions
    result[ state ] = {}
    for transition in targets
      result[ state ][ transition ] =
        when: When[ transition ] ? When.generate transition
        run: Run[ transition ] ? Run.generate transition
  console.log machine: result
  result

Machine =

  start: ( state ) ->

    queue = do Queue.make

    events = do ->
      loop
        event = await do queue.dequeue
        yield event

    do ->
      for await talos from Async.start machine, { state }, events
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