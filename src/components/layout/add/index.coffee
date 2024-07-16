import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import html from "./html"
import css from "./css"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-add-layout"
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
        Rio.render html
      ]

    ]
  ]