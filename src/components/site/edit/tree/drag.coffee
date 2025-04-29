import * as Fn from "@dashkite/joy/function"
import * as Text from "@dashkite/joy/text"
import * as K from "@dashkite/katana/async"
import Registry from "@dashkite/rio-helium"
import Observable from "@dashkite/rio-observable"

accepts = ({ source, target, gadgets }) ->
  !( source == target ) &&
    !( gadgets.within source, target ) &&
      ( gadgets.accepts source, target )

Drag =

  start: K.peek ( key, event, handle ) ->
    handle.drag = source: key
    # setting this to all seems to set the cursor
    # to copy at least on chrome
    event.dataTransfer.effectAllowed = "move"

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
      target.classList.add "targeted"
      action = if event.altKey == true then "copy" else "move"
      # should set the cursor to copy but has no effect on chrome
      event.dataTransfer.dropEffect = action
      # need to do also set this, see below
      handle.drag.action = action 
    else
      event.dataTransfer.dropEffect = "none"

  leave: K.peek ( event, handle ) ->
    if handle.drag?
      target = event.target.closest ".zone"
      target.classList.remove "targeted"
      event.dataTransfer.dropEffect = "none"

  drop: Fn.flow [
    K.poke ( event, handle ) -> event.target.closest ".zone"
    Registry.get "https://application/state"
    Observable.update [
      K.peek ( state, target, handle ) ->
        if handle.drag?      
          switch handle.drag.action
            when "move"
              { gadgets } = state
              source = gadgets.get handle.drag.source
              destination = gadgets.get target.dataset.key
              if ( index = target.dataset.index )?
                source.move destination, Text.parseNumber index
              else
                source.move destination
              delete handle.drag
            when "copy"
              { gadgets } = state
              source = gadgets.get handle.drag.source
              destination = gadgets.get target.dataset.key
              if ( index = target.dataset.index )?
                source.copy destination, Text.parseNumber index
              else
                source.copy destination
              delete handle.drag
    ]
  ]

export default Drag