import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

provideUrl = ->
  Render.field
    label: "URL"
    hint: "A Web URL for the image"
    name: "url"
    type: "url"
    required: true

export { provideUrl }