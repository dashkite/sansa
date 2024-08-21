import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import State from "#helpers/state"

import html from "./html"
import css from "./css"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-add-gadget"
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

      Rio.activate [
        State.load
        Rio.render html
      ]

      Rio.click ".option", [
        Rio.target
        Rio.closest ".option"
        Rio.data
        Rio.dispatch "select"
      ]


    ]
  ]