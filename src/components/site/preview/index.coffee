import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"

import * as Verve from "@dashkite/verve"

import HTML from "@dashkite/html-render"
import { preview, render } from "@dashkite/talisa-render"

import State from "#helpers/state"

import configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import css from "./css"

prerender = K.poke ({ selected, gadgets }) ->
  page = if selected? then gadgets.page selected else "home"
  html: preview page, gadgets

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-preview-site"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      
      Rio.sheets [ 
        Verve.component
        Verve.color
        Verve.icons
        Verve.hints
        Verve.gadgets
        css 
      ]

      Rio.activate [
        State.load
        prerender
        Rio.render html
      ]

    ]

    Rio.connect [
      State.observe [
        prerender
        Rio.render html
      ]
    ]

    Rio.disconnect [ State.cancel ]
  ]