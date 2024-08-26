import HTML from "@dashkite/html-render"
import "@dashkite/vellum"

import icon from "#helpers/icons"

import * as Render from "./render"

template = ({ site, context... }) ->

  sizes = JSON.stringify site.preferences.editor.sizes

  HTML.main [

    HTML.header part: "header", [
      HTML.div [
        HTML.h1 [
          if context.editing == "title"
            HTML.input
              name: "title"
              type: "text"
              value: site.title
          else
            HTML.span site.title
        ]

        HTML.p [
          if context.editing == "description"
            HTML.input
              name: "description"
              type: "text"
              value: site.description
          else
            HTML.span site.description
        ]
      ]
    ]

    HTML.div [
      HTML.tag "vellum-splitter", data: { sizes }, [
        HTML.div slot: "navigator", [
          Render.actions context
          Render.tree context
        ]
        HTML.div slot: "preview", [
          Render.preview context
        ]
        HTML.div slot: "editor", [
          Render.editor context
        ]
      ]
    ]
  ]

export default template