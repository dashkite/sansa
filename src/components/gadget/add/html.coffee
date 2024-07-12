import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

template = ({ data, errors }) ->

  HTML.render [

    HTML.form [

      HTML.slot name: "header", [
        HTML.header part: "header", [
          HTML.h1 "Add Gadget"
        ]
      ]

      HTML.div [

        Render.field
          name: "name"
          hint: "The display name for the Gadget"
          label: "Name"
          type: "text"
          required: true
          value: data.name
          error: errors.name

        Render.field
          name: "description"
          label: "Description"
          type: "text"
          required: true
          value: data.description
          error: errors.description

      ]

      HTML.footer [
        HTML.button "Save"
        HTML.a href: "#cancel", "Cancel"
      ]

    ]

  ]

export default template