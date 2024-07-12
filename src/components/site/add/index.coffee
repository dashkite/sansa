import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import Router from "@dashkite/rio-oxygen"
import HTTP from "@dashkite/rio-vega"
import * as Arriba from "@dashkite/rio-arriba"

import Site from "#helpers/site"

import configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import css from "./css"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-add-site"
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

      Rio.describe [
        HTTP.resource {
          origin
          name: "sites"
        }
      ]

      Rio.click "[href='#cancel']", [ Router.back ]

      Rio.submit [
        HTTP.post [
          HTTP.json [ Site.save ]
          HTTP.success [ Rio.dispatch "success" ]
          HTTP.failure [ Rio.dispatch "failure" ]
        ]
      ]

    ]
  ]