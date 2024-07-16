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

template = ->

  HTML.render [

    HTML.form [

      HTML.slot name: "header", [
        HTML.header part: "header", [
          HTML.h1 "Add Layout"
        ]
      ]

      HTML.div [

        Render.field
          name: "name"
          label: "Name"
          hint: "A display name for the Gadget"
          type: "text"
          required: true
          value: "Untitled Layout"
          error: undefined

        Render.field
          name: "orientation"
          label: "Orientation"
          hint: "The direction in which items flow within the layout"
          type: "enum"
          options: [
            "Horizontal"
            "Vertical"
          ]
          required: true
          value: "Horizontal"
          error: undefined

        Render.field
          name: "wrap"
          label: "Wrap"
          hint: "Whether items wrap if they overflow the layout"
          type: "boolean"
          value: true
          error: undefined

        Render.field
          name: "width"
          label: "Width"
          hint: "How much horizontal space the layout should consume"
          type: "range"
          value: "auto"
          range: [
            "narrowest"
            "narrower"
            "narrow"
            "auto"
            "wide"
            "wider"
            "widest"
          ]
          error: undefined

      ]

    ]

  ]

export default template