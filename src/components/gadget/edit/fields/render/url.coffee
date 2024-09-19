import * as Render from "@dashkite/rio-arriba/render"

url = ( value ) ->
  Render.field
    name: "url"
    label: "URL"
    hint: "The URL for the link"
    type: "url"
    required: true
    value: value

export { url }