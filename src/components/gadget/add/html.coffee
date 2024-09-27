import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"

import icon from "#helpers/icons"

type = ( name, label ) ->
  label ?= Format.title name
  HTML.div class: "option", data: type: name, [
    icon name
    HTML.span label
  ]

template = ({ selected, gadgets }) ->

  options = if selected?
    gadgets
      .get selected
      .accepts()
  else []

  # we always add top-level gadgets since
  # they don't depend on selected
  options = [ 
    Gadget.roots...
    options... 
  ]

  HTML.render [

    HTML.main [

      HTML.slot name: "header", [
        HTML.header part: "header", [
          HTML.h1 "Add Gadget"
        ]
      ]

      HTML.div class: "options",
        for option in options
          type option

    ]

  ]

export default template