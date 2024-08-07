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
          HTML.h1 "Edit Link"
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
          name: "description"
          label: "Description"
          hint: "A description of the link. Helpful for SEO and accessibility."
          type: "text"
          subtype: "prose"
          hints:
            length: "long"
          value: gadget.description

        Render.field
          name: "style"
          label: "Style"
          hint: "The way to display the link"
          type: "enum"
          required: true
          value: gadget.style
          default: "link"
          options: [ "button", "link" ]

        Render.field
          name: "url"
          label: "URL"
          hint: "The URL for the link."
          type: "url"
          value: gadget.url

      ]

    ]

  ]

export default template