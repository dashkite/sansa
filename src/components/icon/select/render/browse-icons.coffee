import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"
import { render } from "@dashkite/talisa-render"

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
                  render Gadget.make
                    type: "icon"
                    brief: { style, icon: option.name }
                  HTML.span Format.title option.name
                ]
        ]
      ]

export default template
