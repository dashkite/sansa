import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"

import State from "#helpers/state"
import Katana from "#helpers/katana"

import Data from "./data"

select = K.peek ( state, key ) ->
  { gadgets } = state
  state.selected = key
  gadget = gadgets.get key
  state.editor =
    action: "edit"
    type: gadget.type

# TODO set the correct editor
renaming = Fn.flow [
  Data.key
  Katana.tag "renaming"
  State.assign
]

rename = K.peek ( data, input ) ->
  { selected, gadgets } = data
  gadget = gadgets.get selected
  gadget.name = input.value

toggle = K.peek ( data, event ) ->
  target = event.target.closest ".node"
  # using a Set avoids adding duplicate keys
  keys = new Set data.open
  if event.newState == "open"
    keys.add target.dataset.key
  else
    keys.delete target.dataset.key
  data.open = Array.from keys

open = K.peek ( state, key ) -> 
  # check is redundant since we use the selector
  # in the event handler to check this, but...
  if !( key in state.open )
    state.open.push key

export default { select, renaming, rename, toggle, open }