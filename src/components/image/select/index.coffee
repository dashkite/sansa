import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Posh from "@dashkite/posh"


# state management
import State from "#helpers/state"

# component state transitions
import States from "./states"

import html from "./html"
import css from "./css"

find = K.mpoke ({ gadgets }, { key }) -> gadgets.get key

initialize = K.peek ( handle ) ->
  handle.state = name: "start", title: "Choose An Image"

aggregate = K.poke ( gadget, { state }) ->
  { gadget, state }

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-select-image"
    Rio.diff

    Rio.field

    Rio.initialize [

      Rio.shadow
      Rio.sheets [ Posh.component, Posh.icons, Posh.forms, Posh.compact, css ]

      initialize

      Rio.describe [
        State.load
        find
        aggregate
        Rio.render html
      ]

      Rio.click "button", [
        K.pop ( event, handle ) ->
          { state } = handle
          name = event
            .target
            .closest "button"
            .getAttribute "name"
          handle.state = await States.next name, { state, event, handle }
          
        Rio.description
        State.load
        find
        aggregate
        Rio.render html
        Rio.focus "input, vellum-autocomplete"
      ]

      Rio.change "input[type='file']", [
        K.pop ( event, handle ) ->
          { state } = handle
          handle.state = await States.next "uploading", { state, event, handle }
        Rio.description
        State.load
        find
        aggregate
        Rio.render html
      ]

      Rio.input "vellum-autocomplete[name='term']", [
        K.pop ( event, handle ) ->
          { state } = handle
          handle.state = await States.next "search", { state, event, handle }
        Rio.description
        State.load
        find
        aggregate
        Rio.render html
      ]

      Rio.change "vellum-autocomplete[name='term']", [
        K.pop ( event, handle ) ->
          { state } = handle
          handle.state = await States.next "done", { state, event, handle }
        Rio.description
        State.load
        find
        aggregate
        Rio.render html
      ]
      
      Rio.change "input[type='url']", [
        K.pop ( event, handle ) ->
          handle.state.step = "done"
          handle.state.image = {}
          handle.state.image.url = event.target.value
        Rio.description
        State.load
        find
        aggregate
        Rio.render html

      ]
    ]
  ]
