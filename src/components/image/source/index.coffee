import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Posh from "@dashkite/posh"


import { Gadgets } from "@dashkite/talisa"
import State from "#helpers/state"

import html from "./html"
import css from "./css"

find = K.mpoke ({ gadgets }, { key }) ->
  Gadgets.find key, gadgets

aggregate = K.poke ( gadget, handle ) ->
  { gadget, state: handle.state }

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-image-source"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      Rio.sheets [ css, Posh.component, Posh.forms ]

      Rio.describe [
        State.load
        find
        aggregate
        Rio.render html
      ]

      Rio.click ".panel > a", [
        K.pop ( event, handle ) ->
          href = event.target.getAttribute "href"
          handle.state = {}
          handle.state.step = href[1..]
        Rio.description
        State.load
        find
        aggregate
        Rio.render html
      ]

      Rio.click "a[href='#browse']", [
        K.pop ( event, handle ) ->
          do event.target.nextSibling.click
      ]

      Rio.change "input[type='file']", [
        K.pop ( event, handle ) ->
          console.log event.target.files
          # TODO upload the file? or have separate upload step?
          #      do we need to mock this?
          #      set the image specifier fields
          #      move step to preview?
          #      (allows for credit fields, image display)
          #      or just go to the start b/c 
          #      now we have a specifier?
      ]
    ]
  ]
