import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"

import * as Posh from "@dashkite/posh"

import HTML from "@dashkite/html-render"
import { preview, render } from "@dashkite/talisa-render"

import State from "#helpers/state"

import configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import css from "./css"

# srcdoc = K.peek ({ selected, gadgets }, handle ) -> 
#   if ( iframe = handle.root.querySelector "iframe" )?
#     if selected?
#       [ page ] = selected.split "/"
#     else 
#       page = "home"
#     document = HTML.render render page, gadgets
#     if ( document != iframe.srcdoc )
#       iframe.srcdoc = document

prerender = K.poke ({ selected, gadgets }) ->
  if selected?
    [ page ] = selected.split "/"
  else
    page = "home"
  html: preview page, gadgets

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-preview-site"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      
      Rio.sheets [ 
        Posh.component
        Posh.hints
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