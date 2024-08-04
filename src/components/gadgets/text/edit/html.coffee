import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import * as Format from "@dashkite/rio-arriba/format"
import icon from "#helpers/icons"

type = ( name, label ) ->
  label ?= Format.label name
  HTML.div class: "option", data: type: name, [
    icon name
    HTML.span label
  ]

template = ( gadget ) ->

  HTML.render [

    HTML.form [

      HTML.slot name: "header", [
        HTML.header part: "header", [
          HTML.h1 "Edit Text"
        ]
      ]

      HTML.div [

        Render.field
          name: "name"
          label: "Name"
          hint: "A display name for the Gadget"
          type: "text"
          required: true
          value: gadget.name

        Render.field
          name: "text"
          label: "Text"
          hint: "The text to display. May include 
            <a href='https://www.markdownguide.org/basic-syntax/'>Markdown</a>."
          type: "markdown"
          subtype: "prose"
          hints:
            length: "long"
          value: gadget.text



      ]

    ]

  ]

export default template