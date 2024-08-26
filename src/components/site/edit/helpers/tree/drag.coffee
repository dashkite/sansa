import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"

accepts = ({ source, target, gadgets }) ->
  !( source == target ) &&
    !( gadgets.within source, target ) &&
      ( gadgets.accepts source, target )

Drag =

  start: K.peek ( key, event, handle ) ->
    handle.drag = source: key
    event.dataTransfer.effectAllowed = "move"

  over: K.peek ( state, event, handle ) ->
    { source } = handle.drag
    { gadgets } = state
    target = event.target.closest ".node"
    if ( accepts { source, target: target.dataset.key, gadgets })
      event.target.classList.add "targeted"
    else
      event.dataTransfer.dropEffect = "none"

  leave: K.peek ( event, handle ) ->
    event.target.classList.remove "targeted"

  drop: K.peek ( state, event, handle ) ->
    event.target.classList.remove "targeted"
    delete handle.drag
    { source } = handle.drag
    { parent, at, target } = { event.target.dataset... }
    { gadgets } = state
    gadgets.move { source, parent, location: { at, target }}

export default Drag