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

  gadget = gadgets.get selected

  options = gadget.accepts()

  # we always add top-level gadgets since
  # they don't depend on selected
  options = [ 
    Gadget.roots...
    options... 
  ]

  content = options.filter ( option ) -> !( option in Gadget.mixins )
  mixins = options.filter ( option ) -> ( option in Gadget.mixins )

  HTML.render [

    HTML.main [

      HTML.slot name: "header", [
        HTML.header part: "header", [
          HTML.h1 "Add Gadget"
        ]
      ]

      HTML.header part: "header", [
        HTML.h2 "Content"
      ] 
      
      if content.length > 0
        HTML.div class: "options",
          for option in options when !( option in Gadget.mixins )
            type option
      else
        HTML.span "No content gadgets available."

      HTML.header part: "header", [
        HTML.h2 "Mixins"
      ]

      if mixins.length > 0
        HTML.div class: "options",
          for option in options when ( option in Gadget.mixins )
            type option
      else
        HTML.span "No mixins available."

    ]

  ]

export default template