import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import { Gadgets } from "@dashkite/talisa"

Drag =

  start: K.peek ( key, event, handle ) ->
    handle.drag = source: key
    event.dataTransfer.effectAllowed = "move"

  over: K.peek ( event, handle ) ->
    { source } = handle.drag
    target = event.target.closest ".node"
    if !( target.dataset.key.startsWith source )
      event.target.classList.add "targeted"
    else
      event.dataTransfer.dropEffect = "none"

  leave: K.peek ( event, handle ) ->
    event.target.classList.remove "targeted"

  drop: K.peek ( state, event, handle ) ->
    { action, target } = { event.target.dataset... }
    event.target.classList.remove "targeted"
    { source } = handle.drag
    delete handle.drag
    Fn.apply Gadgets[ action ], [{ source, target }, state.gadgets ]


export default Drag