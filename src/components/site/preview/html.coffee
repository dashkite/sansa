import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

template = ->
  HTML.main [
    do HTML.iframe
  ]

export default template