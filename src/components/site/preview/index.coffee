import * as Fn from "@dashkite/joy/function"
import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import Observable from "@dashkite/rio-observable"
import Registry from "@dashkite/rio-helium"

import Verve from "@dashkite/verve"
import HTML from "@dashkite/html-render"
import { preview, render } from "@dashkite/talisa-render"

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
        Verve.all...
      ]
      
      # Rio.sheets [ 
      #   Verve.component
      #   Verve.color
      #   Verve.icons
      #   Verve.hints
      #   Verve.gadgets
      #   css 
      # ]

      Rio.activate [
        Registry.get "sansa.editor.state"
        Observable.get
        prerender
        Rio.render html
      ]

    ]

    Rio.connect [
      Fn.flow [
        Registry.get "sansa.editor.state"
        Observable.observe [
          prerender
          Rio.render html
        ]
      ]

    ]

    Rio.disconnect [ Observable.cancel ]
  ]