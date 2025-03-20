import HTML from "@dashkite/html-render"

template = ->

  HTML.nav [
    HTML.label [
      HTML.button type: "button", name: "browse files",  "Files"
      HTML.input name: "path", type: "file", accept: "image/*"
    ]
    HTML.button type: "button", name: "browse gadgets", "Gadgets"
    HTML.button type: "button", name: "browse unsplash", "Unsplash"
    HTML.button type: "button", name: "provide url", "Web URL"
  ]

import { Templates } from "#helpers/registries"

Templates
  .get "wayland-select-image"
  .add "start", template
