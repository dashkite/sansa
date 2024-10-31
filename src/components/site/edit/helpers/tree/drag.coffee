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
    if handle.drag?
      target = event.target.closest ".zone"
      { gadgets } = state
      parent = gadgets.get target.dataset.parent
      source = gadgets.get handle.drag.source
      if parent.canAdd source
        target.classList.add "targeted"
      else
        event.dataTransfer.dropEffect = "none"
    else
      event.dataTransfer.dropEffect = "none"

  leave: K.peek ( event, handle ) ->
    target = event.target.closest ".zone"
    target.classList.remove "targeted"

  drop: K.peek ( state, event, handle ) ->
    if handle.drag?
      target = event.target.closest ".zone"
      { gadgets } = state
      source = gadgets.get handle.drag.source
      destination = gadgets.get target.dataset.key
      index = target.dataset.index
      source.moveTo parent, index
      delete handle.drag

export default Drag