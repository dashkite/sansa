import HTML from "@dashkite/html-render"
import Templates from "./registry"

Templates.add "provide url", ->
  HTML.tag "vellum-field",
    label: "URL"
    hint: "A Web URL for the image"
    name: "url"
    type: "url"
    required: true


