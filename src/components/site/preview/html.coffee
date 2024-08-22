import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

template = ->

  HTML.render [

    HTML.main [

      HTML.slot name: "header", [
        HTML.header part: "header", [
          HTML.h1 "Site Preview"
        ]
      ]

    ]
  ]

export default template