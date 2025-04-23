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

  accepts = gadget?.accepts ? []

  roots = Gadget.Types.roots  
  content = accepts.filter Gadget.Types.isContent
  mixins = accepts.filter Gadget.Types.isMixin

  HTML.main [

    HTML.slot name: "header", [
      HTML.header part: "header", [
        HTML.h1 "Add Gadget"
      ]
    ]

    HTML.div class: "options",
      for option in roots
        type option

    HTML.header part: "header", [
      HTML.h2 "Content"
    ] 
    
    if content.length > 0
      HTML.div class: "options",
        for option in content
          type option
    else
      HTML.span "No content gadgets available."

    HTML.header part: "header", [
      HTML.h2 "Mixins"
    ]

    if mixins.length > 0
      HTML.div class: "options",
        for option in mixins
          type option
    else
      HTML.span "No mixins available."

  ]

export default template