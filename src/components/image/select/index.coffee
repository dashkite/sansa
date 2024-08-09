import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Posh from "@dashkite/posh"


import { Gadgets } from "@dashkite/talisa"
# state management
import State from "#helpers/state"

# component state transitions
import States from "./states"

import html from "./html"
import css from "./css"

find = K.mpoke ({ gadgets }, { key }) ->
  Gadgets.find key, gadgets

initialize = K.peek ( handle ) ->
  handle.state = name: "start", title: "Choose An Image"

aggregate = K.poke ( gadget, { state }) ->
  { gadget, state }

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-select-image"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      Rio.sheets [ Posh.component, Posh.forms, css ]

      initialize

      Rio.describe [
        State.load
        find
        aggregate
        Rio.render html
      ]

      Rio.click "a", [
        K.pop ( event, handle ) ->
          name = ( event.target.getAttribute "href" )[1..]
          handle.state = States.next name, handle.state
          
        Rio.description
        State.load
        find
        aggregate
        Rio.render html
      ]

      # TODO do we even need this as a step?
      # Rio.click "a[href='#browse']", [
      #   K.pop ( event, handle ) ->
      #     do event.target.nextSibling.click
      # ]

      Rio.change "input[type='file']", [
        K.pop ( event, handle ) ->
          handle.state.step = "uploading"
          handle.state.image = {}
          handle.state.image.url = URL.createObjectURL event.target.files[0]

          # TODO upload the file? or have separate upload step?
          #      do we need to mock this?
          #      set the image specifier fields
          #      move step to preview?
          #      (allows for credit fields, image display)
          #      or just go to the start b/c 
          #      now we have a specifier?
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
