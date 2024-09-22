import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"

field = ( key, specifier, { context..., gadget }) ->
  HTML.tag "vellum-field",
    name: key
    label: specifier.title ? Format.title key
    hint: specifier.hint
    type: specifier.type
    required: specifier.required ? true
    value: gadget[ key ]

export { field }