import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import * as Format from "@dashkite/rio-arriba/format"

empty = ( array ) -> !( array? && array.length > 0 )

template = ({ style, results, term }) ->

    HTML.tag "vellum-field",
      name: "term"
      type: "custom"
      value: term
      [
        HTML.span slot: "label", "Search Icons"
        HTML.span slot: "hint", "Search the icons from Remixicon"   
        HTML.div slot: "input", [
          HTML.tag "vellum-autocomplete",
            name: "term"
            value: term
            data: state: if empty results then "closed" else "open"
            if results?
              for option in results
                HTML.div slot: "option", data: value: option.name, [
                  HTML.i class: "ri-#{ option.name }-#{ style }"
                  HTML.span Format.title option.name
                ]
        ]
      ]

export default template
