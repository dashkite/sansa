import HTML from "@dashkite/domo"

template = ->
  HTML.tag "vellum-field",
    label: "URL"
    hint: "A Web URL for the image"
    name: "url"
    type: "url"
    required: true

export default template

