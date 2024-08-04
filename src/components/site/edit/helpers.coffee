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

select = K.peek ( state, key ) ->
  state.selected = key
  gadget = Gadgets.find key, state.gadgets
  state.editor =
    action: "edit"
    type: gadget.type

# TODO set the correct editor
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

edit = ( field ) -> 
  K.peek ( state ) -> state.editing = field

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

add = K.peek ( data, event ) ->

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

export default {
  tag
  unset
  run
  key
  gadget
  warn
  log
  focus
  edit
  select
  rename
  renaming
  finish
  toggle
  open
  add
  update
  Drag
}