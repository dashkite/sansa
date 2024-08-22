import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"

import HTML from "@dashkite/html-render"
import render from "@dashkite/talisa-render"

import State from "#helpers/state"

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
        State.load
        Rio.render html
        K.peek ({ selected, gadgets }, handle ) -> 
          iframe = handle.root.querySelector "iframe"
          [ page ] = selected.split "/"
          iframe.srcdoc = HTML.render render page, gadgets
          
      ]

    ]
  ]