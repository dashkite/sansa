import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

template = ({ html }) ->
  # HTML.main [
  #   do HTML.iframe
  # ]

  HTML.main [ html ]

export default template