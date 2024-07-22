import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import * as Format from "@dashkite/rio-arriba/format"
import { Gadgets } from "@dashkite/talisa"

tag = ( key ) ->
  K.poke ( value ) -> [ key ]: value

unset = ( key ) ->
  K.poke ( value ) -> 
    value[ key ] = undefined
    value

run = K.peek ( name, handle ) -> 
  [ action, type ] = name.split /\s+/
  handle.data.editor = { action, type }

key = K.poke ( target ) -> target.dataset.key

warn = K.peek ( error ) -> console.warn { error }

log = ( key ) ->
  K.peek ( value ) -> console.log [ key ]: value 

# TODO maybe there's more elegant way to do this?

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

add = K.peek ( event, handle ) ->

  { type } = event.detail
  { selected, gadgets } = handle.data
  

  # 1. construct the new gadget
  key = selected + "/untitled-#{ type }"
  name = Format.title "untitled #{ type }"
  gadgets.push { key, name, type }

  # 2. add the gadget to the currently selected gadget
  parent = Gadgets.find selected, gadgets
  parent.content.push key

  # 3. ensure the selected gadget is opened
  # using a Set avoids adding duplicate keys
  open = new Set handle.data.open
  open.add selected
  handle.data.open = Array.from open

  # 4. change the selected gadget to be the newly created gadget
  handle.data.selected = key

  # 5. update the editor
  handle.data.editor = { action: "edit", type }

update = K.peek ({ detail: data }, handle ) ->
  { selected, gadgets } = handle.data
  target = Gadgets.find selected, gadgets
  target.name = data.name

updateName = K.peek ( input, handle ) ->
  { selected, gadgets } = handle.data
  gadget = Gadgets.find selected, gadgets
  gadget.name = input.value

export default {
  tag
  unset
  run
  key
  warn
  log
  focus
  toggle
  add
  update
  updateName
}