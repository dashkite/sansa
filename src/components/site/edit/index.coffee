import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import HTTP from "@dashkite/rio-vega"

import configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import css from "./css"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-site-edit"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      
      Rio.sheets [ 
        css
        Posh.component
        Posh.forms
        Posh.icons
      ]

      Rio.describe [
        HTTP.resource {
          origin
          name: "site"
        }
      ]

      Rio.activate [
        HTTP.get [
          HTTP.json [
            Rio.render html
          ]
          HTTP.failure [
            K.peek ( error ) -> console.warn { error }
          ]
        ]
      ]

      Rio.click "input", [
        Rio.intercept
      ]

    ]
  ]