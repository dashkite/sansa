import HTML from "@dashkite/html-render"
import { empty } from "./helpers"

template = ({ results, term, status }, messages ) ->

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
            messages.get [ "select image",  status ]

    ]

export default template