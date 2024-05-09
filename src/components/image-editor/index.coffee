import * as Meta from "@dashkite/joy/metaclass"

import * as R from "@dashkite/rio"
import HTTP from "@dashkite/rio-vega"

import * as Posh from "@dashkite/posh"

import Gadget from "#helpers/gadget"
import Image from "#helpers/image"

import  configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import css from "./css"
import waiting from "./waiting"

class extends R.Handle

  Meta.mixin @, [

    R.tag "dashkite-image-editor"
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
        R.render waiting
        R.form
        R.description
        Image.upload
      ]

      # TODO wait, why?
      R.click "a[name='cancel']", [
        R.reset
      ]

    ]
  ]