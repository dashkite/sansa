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
  console.log { gadget}

  HTML.render [

    HTML.form [

      HTML.slot name: "header", [
        HTML.header part: "header", [
          HTML.h1 "Edit Image"
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
          value: gadget.description

        Render.field
          name: "image"
          label: "Image"
          hint: "The image to display."
          type: "custom"
          html: HTML.div class: "image", [
            HTML.div class: "thumbnail", [
              HTML.img src: gadget.image?.url ? "https://placehold.co/200x150/orange/white"
            ]
            Render.component
              prefix: "sansa"
              action: "select"
              target: "image"
              attributes:
                name: "url"
              bindings: key: gadget.key
          ]
          
      ]

    ]

  ]

export default template