import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana"

import * as Rio from "@dashkite/rio"

import * as DOM from "@dashkite/dominator"
import * as Posh from "@dashkite/posh"

import html from "./html"
import css from "./css"

toggle = ( mode ) -> if mode == "dark" then "light" else "dark"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-select-mode"
    Rio.diff

    Rio.field

    Rio.initialize [

      Rio.shadow
      Rio.sheets [ css, Posh.component, Posh.icons ]

      Rio.activate [
        K.push Fn.pipe [
          Obj.get "dom"
          DOM.attribute "value"
          Obj.tag "mode"
        ]
        Rio.render html
      ]

      Rio.click "label", [
        K.poke ( event, handle ) ->
          mode = ( handle.dom.value = toggle handle.dom.value )
          handle.dispatch "change"
          { mode }
        Rio.render html
      ]

    ]
  ]
