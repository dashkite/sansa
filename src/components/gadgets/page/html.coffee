import HTML from "@dashkite/domo"

template = ( page ) ->

  HTML.form [

    HTML.header part: "L1", [ HTML.h1 "Edit Page" ]

    HTML.div [

      HTML.tag "vellum-field",
        name: "name"
        [
          HTML.span slot: "label", "Name"
          HTML.span slot: "hint", "The name of the gadget"
          HTML.span slot: "input",
            HTML.input name: "name", value: page.name
        ]

      HTML.tag "vellum-field",
        name: "description"
        [
          HTML.span slot: "label", "Description"
          HTML.span slot: "hint", "A description of the gadget"
          HTML.span slot: "input", 
            HTML.textarea name: "description", value: page.description
        ]

    ]

  ]


export default template