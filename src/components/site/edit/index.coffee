import * as Fn from "@dashkite/joy/function"
import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import HTTP from "@dashkite/rio-vega"
import * as Posh from "@dashkite/posh"

import configuration from "#configuration"
{ origin } = configuration

import { Site, Tree, Editor } from "./helpers"
import css from "./css"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-edit-site"
    Rio.diff

    Editor.connect

    Rio.initialize [

      Rio.shadow
      
      Rio.sheets [ 
        css
        Posh.component
        Posh.forms
        Posh.icons
      ]
      
      Site.initialize
      Editor.initialize
      Tree.initialize

      Rio.describe [ HTTP.resource { origin, name: "site" }]

      Rio.activate [ Editor.load ]

    ]
  ]