import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import * as Format from "@dashkite/rio-arriba/format"
import icon from "#helpers/icons"

import Helpers from "./helpers"

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
          HTML.h1 "Edit Layout"
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
          name: "orientation"
          label: "Orientation"
          hint: "The direction in which items flow within the layout"
          type: "enum"
          options: Helpers.Orientation
          required: true
          value: gadget.orientation

        Render.field
          name: "wrap"
          label: "Wrap"
          hint: "Whether items wrap if they overflow the layout"
          type: "boolean"
          value: gadget.wrap

        Render.field
          name: "justification"
          label: "Justification"
          hint: "How are gadgets placed along the axis"
          type: "enum"
          options: Helpers.Justification
          required: true
          value: gadget.justification

        Render.field
          name: "alignment"
          label: "Alignment"
          hint: "How are gadgets placed along the cross axis"
          type: "enum"
          options: Helpers.Alignment
          required: true
          value: gadget.alignment

        Render.field
          name: "width"
          label: "Width"
          hint: "How much horizontal space the layout should consume"
          type: "range"
          value: gadget.width
          range: Helpers.Width

        Render.field
          name: "proximity"
          label: "Proximity"
          hint: "How much space exists between gadgets"
          type: "range"
          value: gadget.proximity
          range: Helpers.Proximity

      ]

    ]

  ]

export default template