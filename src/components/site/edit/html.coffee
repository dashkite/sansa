import HTML from "@dashkite/html-render"
import "@dashkite/vellum"

import * as Render from "./render"

template = ({ site, context... }) ->

  sizes = JSON.stringify site.preferences.sizes

  HTML.render [

    HTML.header part: "header", [
      HTML.div [
        HTML.h1 site.name
        HTML.p site.description
      ]
    ]

    HTML.main [
      HTML.tag "vellum-splitter", data: { sizes }, [
        HTML.div slot: "navigator", [
          Render.actions context
          Render.tree context
        ]
        HTML.div slot: "preview", []
        HTML.div slot: "editor", [
          Render.editor context
        ]
      ]
    ]
  ]

export default template