import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import Router from "@dashkite/rio-oxygen"
import * as Arriba from "@dashkite/rio-arriba"

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

      Arriba.validate html

      Rio.click "[href='#cancel']", [ Router.back ]

      # Rio.submit [

      # ]

    ]
  ]