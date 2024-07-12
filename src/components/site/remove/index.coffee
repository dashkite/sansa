import * as Fn from "@dashkite/joy/function"
import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import HTTP from "@dashkite/rio-vega"
import Router from "@dashkite/rio-oxygen"

import Site from "#helpers/site"

import configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import css from "./css"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-remove-site"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      
      Rio.sheets [ 
        css
        Posh.component
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
          HTTP.json [ Rio.render html ]
          HTTP.failure [
            K.peek ( error ) -> console.warn { error }            
          ]
        ]
      ]

      Rio.click "button", [
        HTTP.delete [
          HTTP.success [
            Rio.description
            Site.remove
            Rio.dispatch "success" 
          ]
          HTTP.failure [ Rio.dispatch "failure" ]
        ]
      ]

      Rio.click "[href='#cancel']", [ Router.back ]

    ]
  ]