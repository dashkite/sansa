import HTML from "@dashkite/html-render"

template = ->
  HTML.tag "vellum-field",
    label: "URL"
    hint: "A Web URL for the image"
    name: "url"
    type: "url"
    required: true

export default template

