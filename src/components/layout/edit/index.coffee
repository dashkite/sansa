import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import State from "#helpers/state"
import Helpers from "./helpers"

import html from "./html"
import css from "./css"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-edit-layout"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      
      Rio.sheets [ 
        css
        Posh.component
        Posh.forms
        Posh.animations
        Posh.icons
      ]

      State.observe [
        Helpers.gadget
        Rio.render html
        # Helpers.focus
      ]

      Rio.activate [
        State.load
        Helpers.gadget
        Rio.render html
      ]

      Rio.input "form", [
        Rio.intercept
        Rio.form
        Rio.dispatch "input"
      ]

    ]
  ]