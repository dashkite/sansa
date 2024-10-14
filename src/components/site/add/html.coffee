import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

template = ({ data, errors }) ->

  HTML.render [

    HTML.form [

      HTML.slot name: "header", [
        HTML.header part: "L1", [
          HTML.h1 "Create Site"
        ]
      ]

      HTML.div [

        HTML.tag "vellum-field", 
          name: "title"
          type: "text"
          required: true
          value: data.title
          error: errors.name
          [
            HTML.label slot: "label", "Title"
            HTML.span slot: "hint", "The title for your site"
          ]

        HTML.tag "vellum-field",
          name: "description"
          type: "prose"
          value: data.description
          error: errors.description
          class: "short"
          [
            HTML.label slot: "label", "Description"
            HTML.span slot: "hint", "A brief description of your site"
          ]

      ]

      HTML.footer [
        HTML.button "Save"
        HTML.a href: "#cancel", "Cancel"
      ]

    ]

  ]

export default template