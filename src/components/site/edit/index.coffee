import * as Fn from "@dashkite/joy/function"
import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"

import * as Rio from "@dashkite/rio"
import HTTP from "@dashkite/rio-vega"

import * as Posh from "@dashkite/posh"

import css from "./css"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-edit-site"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      
      Rio.sheets [ 
        css
        Posh.component
        Posh.forms
        Posh.icons
      ]

      Frame.events
      Tree.events
      Editor.events

    ]

    Rio.connect [
      Montrose.observe [ "state", "site" ], [
        Rio.render html
      ]
    ]

    Rio.disconnect [
      Montrose.cancel [ "state", "site" ]
    ]

  ]