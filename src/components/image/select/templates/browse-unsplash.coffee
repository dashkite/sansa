import HTML from "@dashkite/html-render"

import Messages from "#helpers/messages"

import Templates from "./registry"

empty = ( array ) -> !( array? && array.length > 0 )

Templates.add "browse unsplash", ({ results, term, status }) ->

  open = results? && ( results.length > 0 )

  HTML.tag "vellum-field",
    label: "Search"
    hint: "Search Unsplash Images"
    name: "search"
    required: true
    [
      HTML.tag "vellum-autocomplete",
        name: "term"
        value: term
        data: state: if open then "open" else "closed"
        slot: "input"
        if results? && results.length > 0
          for result in results
            HTML.div slot: "option", data: value: result.image.url, [
              HTML.img src: result.image.url
              HTML.span result.name
            ]
        else if status?
          HTML.div slot: "status",
            Messages.get [ "select image",  status ]

    ]


