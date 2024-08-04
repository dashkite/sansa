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

template = ({ name, icon, text, size }) ->

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
          value: name

        Render.field
          name: "icon"
          label: "Icon"
          hint: "The name of the icon to display"
          type: "text"
          required: true
          value: icon

        Render.field
          name: "text"
          label: "Text"
          hint: "The text to display alongside the icon"
          type: "text"
          value: text

        Render.field
          name: "size"
          label: "Size"
          hint: "The relative size of the icon and accompanying text."
          type: "range"
          value: size
          range: [
            "smallest"
            "smaller"
            "small"
            "auto"
            "large"
            "larger"
            "largest"
          ]

      ]

    ]

  ]

export default template