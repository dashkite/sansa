import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import * as Format from "@dashkite/rio-arriba/format"
import icon from "#helpers/icons"

type = ( name, label ) ->
  label ?= Format.label name
  HTML.div class: "option", data: type: name, [
    icon name
    HTML.span label
  ]

template = ->

  HTML.render [

    HTML.main [

      HTML.slot name: "header", [
        HTML.header part: "header", [
          HTML.h1 "Add Gadget"
        ]
      ]

      HTML.div class: "options", [
        type "page"
        type "layout"
        type "navigation"
        type "link"
        type "text"
        type "image"
        type "icon"
      ]

    ]

  ]

export default template