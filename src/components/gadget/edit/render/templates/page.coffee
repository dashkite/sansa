import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { icon } from "#helpers/icons"

page = ({ name, title, hint }, value ) ->

  HTML.tag "vellum-field",
    name: name
    value: value
    [
      HTML.span slot: "label", title ? Format.title name
      HTML.span slot: "hint", hint
      HTML.div slot: "input", [
        HTML.div if value?
          [
            icon "page"
            HTML.span Format.title value
          ]
        else
          [ HTML.span "No page selected" ]

        HTML.tag "sansa-select-page"
          attributes:
            name: "page"
            exportparts: "L1:L2, L2:L3, L3:L4"

      ]
    ]

export { page }