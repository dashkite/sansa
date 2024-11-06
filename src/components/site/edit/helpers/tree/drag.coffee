import * as Fn from "@dashkite/joy/function"
import * as Text from "@dashkite/joy/text"
import * as K from "@dashkite/katana/async"

accepts = ({ source, target, gadgets }) ->
  !( source == target ) &&
    !( gadgets.within source, target ) &&
      ( gadgets.accepts source, target )

Drag =

  start: K.peek ( key, event, handle ) ->
    handle.drag = source: key
    event.dataTransfer.effectAllowed = "all"

  over: K.peek ( state, event, handle ) ->
    targetable = if handle.drag?
      { gadgets } = state
      source = gadgets.get handle.drag.source
      target = event.target.closest ".zone"
      destination = gadgets.get target.dataset.key
      if ( index = target.dataset.index )?
        destination.canAdd source, Text.parseNumber index
      else
        destination.canAdd source
    else false
    if targetable
      action = if event.altKey then "copy" else "move"
      target.classList.add "targeted"
      target.classList.add action
      event.dataTransfer.dropEffect = action
      # need to do also set this, see below
      handle.drag.action = action 
    else
      event.dataTransfer.dropEffect = "none"

  leave: K.peek ( event, handle ) ->
    target = event.target.closest ".zone"
    target.classList.remove "targeted"

  drop: K.peek ( state, event, handle ) ->
    if handle.drag?
      # TODO doesn't work, due to a bug in Chromium:
      # https://issues.chromium.org/issues/40068941
      # switch event.dataTransfer.dropEffect
      switch handle.drag.action
        when "move"
          { gadgets } = state
          source = gadgets.get handle.drag.source
          target = event.target.closest ".zone"
          destination = gadgets.get target.dataset.key
          if ( index = target.dataset.index )?
            source.move destination, Text.parseNumber index
          else
            source.move destination
          delete handle.drag
        when "copy"
          { gadgets } = state
          source = gadgets.get handle.drag.source
          target = event.target.closest ".zone"
          destination = gadgets.get target.dataset.key
          if ( index = target.dataset.index )?
            source.copy destination, Text.parseNumber index
          else
            source.copy destination
          delete handle.drag

export default Drag