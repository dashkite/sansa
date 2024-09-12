import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

template = ->
  Render.field
    label: "URL"
    hint: "A Web URL for the image"
    name: "url"
    type: "url"
    required: true

export default template