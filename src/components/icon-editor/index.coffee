import * as Meta from "@dashkite/joy/metaclass"

import * as R from "@dashkite/rio"
import HTTP from "@dashkite/rio-vega"

import * as Posh from "@dashkite/posh"

import Gadget from "#helpers/gadget"

import  configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import css from "./css"

class extends R.Handle

  Meta.mixin @, [

    R.tag "dashkite-icon-editor"
    R.diff

    R.initialize [
      R.shadow
      R.sheets [ css, Posh.component ]

      R.describe [
        HTTP.resource ({ site, branch }) ->
          origin: origin
          name: "branch"
          bindings: { site, branch }
      ]

      R.activate [
        R.description
        Gadget.get
        R.render html
      ]

      R.submit [
        Gadget.get
        R.form
        R.assign
        R.dispatch "change"
      ]

      R.click "a[name='cancel']", [
        R.reset
      ]
    ]
  ]