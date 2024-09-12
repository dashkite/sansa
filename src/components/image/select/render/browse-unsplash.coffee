import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

empty = ( array ) -> !( array? && array.length > 0 )

template = ({ results, term }) ->

  Render.field
    label: "Search"
    hint: "Search Unsplash Images"
    name: "term"
    type: "custom"
    required: true
    html: HTML.tag "vellum-autocomplete",
      name: "term"
      value: term
      data: state: if empty results then "closed" else "open"
      if results?
        for result in results
          HTML.div slot: "option", data: value: result.image.url, [
            HTML.img src: result.image.url
            HTML.span result.name
          ]    

export default template
