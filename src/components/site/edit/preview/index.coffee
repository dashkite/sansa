import * as Fn from "@dashkite/joy/function"
import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import Observable from "@dashkite/rio-observable"
import Registry from "@dashkite/rio-helium"

import Verve from "@dashkite/verve"
import HTML from "@dashkite/html-render"
import { Gadget } from "@dashkite/talisa"
import { preview } from "@dashkite/talisa-render"

import configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import css from "./css"

prerender = K.poke ({ selected, gadgets }) ->
  page = if selected?
    gadgets
      .get selected
      ?.page
  else
    # otherwise just use the first page
    gadgets.find Gadget.withType "page"
  # it's still possible that there's no page
  # either because selected somehow got out of sync
  # (should never happen but might as well check)
  # or the site is simply empty
  html: if page? then preview page

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-preview-site"
    Rio.diff

    Rio.initialize [

      Rio.shadow

      Rio.sheets [
        Verve.all...
        css
      ]

      Rio.activate [
        Registry.get "https://application/state"
        Observable.get
        prerender
        Rio.render html
      ]

    ]

    Rio.connect [
      Fn.flow [
        Registry.get "https://application/state"
        Observable.observe [
          prerender
          Rio.render html
        ]
      ]

    ]

    Rio.disconnect [ Observable.cancel ]
  ]