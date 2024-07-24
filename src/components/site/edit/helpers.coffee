import * as Fn from "@dashkite/joy/function"
import * as Arr from "@dashkite/joy/array"
import * as K from "@dashkite/katana/async"
import * as Format from "@dashkite/rio-arriba/format"
import { Gadget, Gadgets } from "@dashkite/talisa"

import State from "#helpers/state"

tag = ( key ) ->
  K.poke ( value ) -> [ key ]: value

unset = ( key ) ->
  K.poke ( value ) -> 
    value[ key ] = undefined
    value

run = K.peek ( data, name ) -> 
  [ action, type ] = name.split /\s+/
  data.editor = { action, type }

key = K.poke ( target ) -> target.dataset.key

# slightly different variation than the one for layout editor
gadget = K.mpoke ({ gadgets }, key ) ->
  Gadgets.find key, gadgets

warn = K.peek ( error ) -> console.warn { error }

log = ( key ) ->
  K.peek ( value ) -> console.log [ key ]: value 

select = Fn.flow [
  key
  tag "selected"
  unset "renaming"
  State.assign
]

renaming = Fn.flow [
  key
  tag "renaming"
  State.assign
]

finish = K.push -> renaming: undefined


focus = Fn.flow [
  K.read "handle"
  K.peek ( handle ) ->
    handle
      .root
      .querySelectorAll "input"
      .values()
      .find ( input ) -> input.checkVisibility()
      ?.focus()
]

toggle = K.peek ( data, event ) ->
  # using a Set avoids adding duplicate keys
  keys = new Set data.open
  if event.newState == "open"
    keys.add event.target.dataset.key
  else
    keys.delete event.target.dataset.key
  data.open = Array.from keys

open = K.peek ( state, key ) -> 
  # check is redundant since we use the selector
  # in the event handler to check this, but...
  if !( key in state.open )
    state.open.push key

edit = K.peek ( data, event ) ->

  { type } = event.detail
  { selected, gadgets } = data
  
  # 1. construct the new gadget
  key = selected + "/untitled-#{ type }"
  name = Format.title "untitled #{ type }"
  gadgets.push Gadget.make { key, name, type }

  # 2. add the gadget to the currently selected gadget
  parent = Gadgets.find selected, gadgets
  parent.content.push key

  # 3. ensure the selected gadget is opened
  # using a Set avoids adding duplicate keys
  open = new Set data.open
  open.add selected
  data.open = Array.from open

  # 4. change the selected gadget to be the newly created gadget
  data.selected = key

  # 5. update the editor
  data.editor = { action: "edit", type }

update = K.peek ( data, { detail }) ->
  { selected, gadgets } = data
  target = Gadgets.find selected, gadgets
  Object.assign target, detail

rename = K.peek ( data, input ) ->
  { selected, gadgets } = data
  gadget = Gadgets.find selected, gadgets
  gadget.name = input.value

drop = K.peek ( state, target, event ) ->
  source = event.dataTransfer.getData "text/plain"

  console.log "drop #{ source } onto #{ target }"
  # TODO check for linked gadgets
  # assuming just one reference exists
  [ parent ] = Gadgets.references source, state.gadgets

  console.log "remove #{ source } from #{ parent?.key }"
  parent = Gadget.remove source, parent
  # TODO support mutation?
  # this is awkward and we have to do it again below
  state.gadgets = Gadgets.remove parent.key, state.gadgets
  state.gadgets.push parent

  console.log "add to #{ target }"
  _target = Gadgets.find target, state.gadgets
  _target = Gadget.add source, _target
  state.gadgets = Gadgets.remove _target.key, state.gadgets
  state.gadgets.push _target


export default {
  tag
  unset
  run
  key
  gadget
  warn
  log
  focus
  select
  rename
  renaming
  finish
  toggle
  open
  edit
  update
  drop
}