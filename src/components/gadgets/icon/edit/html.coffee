import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import * as Format from "@dashkite/rio-arriba/format"
import icon from "#helpers/icons"
import Icons from "./icons"

type = ( name, label ) ->
  label ?= Format.label name
  HTML.div class: "option", data: type: name, [
    icon name
    HTML.span label
  ]

template = ({ name, style, icon, display, options, size }) ->
  console.log "rendering..."

  HTML.form [

    HTML.slot name: "header", [
      HTML.header part: "header", [
        HTML.h1 "Edit Icon"
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
        name: "style"
        label: "Style"
        hint: "What style of icon is it?"
        type: "enum"
        required: true
        value: style
        default: "line"
        options: [ "line", "fill" ]

      Render.field
        name: "icon"
        label: "Icon"
        hint: "The name of the icon to display"
        type: "custom"
        html: Icons.html { icon, style, display, options }

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


export default template