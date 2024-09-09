import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

# TODO actual upload :D
# TODO progress bar

fileUpload = ->

  HTML.label [
    HTML.span "Uploading&hellip;"
    HTML.progress max: "100", value: "10"
  ]


export { fileUpload }
