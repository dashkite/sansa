import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import "@dashkite/vellum"
import node from "./node"

template = ( site ) ->

  sizes = site.preferences?.sizes ? [ 25, 50, 25 ]

  HTML.render [

    HTML.header part: "header", [
      HTML.div [
        HTML.h1 site.name
        HTML.p site.description
      ]
    ]

    HTML.main [
      HTML.tag "vellum-splitter", data: sizes: "#{ JSON.stringify sizes }", [
        HTML.div slot: "navigator", [
          node type: "page", name: "Home", [
            node type: "layout", name: "Header", [
              node type: "image", name: "Logo"
            ]
          ]
        ]
        HTML.div slot: "preview", [
        ]
        HTML.div slot: "editor", [
        ]
      ]
    ]
  ]

export default template