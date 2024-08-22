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

    Rio.tag "sansa-preview-site"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      
      Rio.sheets [ css ]

      Rio.activate [
        Rio.render html
      ]

    ]
  ]