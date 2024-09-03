import * as Render from "@dashkite/rio-arriba/render"

text = ( value ) ->

  Render.field
    name: "text"
    label: "Text"
    hint: "The text to display. May include 
      <a href='https://www.markdownguide.org/basic-syntax/'>Markdown</a>."
    type: "markdown"
    subtype: "prose"
    hints:
      length: "long"
    value: value

export { text }