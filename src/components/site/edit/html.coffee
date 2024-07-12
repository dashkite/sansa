import HTML from "@dashkite/html-render"
import "@dashkite/vellum"

import * as Render from "./render"

template = ({ site, action, selected, renaming }) ->

  sizes = JSON.stringify site.preferences.sizes
  gadgets = site.branches.main

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
          Render.actions { gadgets, selected }
          Render.tree { gadgets, selected, renaming } 
        ]
        HTML.div slot: "preview", []
        HTML.div slot: "editor", [
          Render.editor { action, gadgets, selected, renaming }
        ]
      ]
    ]
  ]

export default template