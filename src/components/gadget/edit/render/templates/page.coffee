import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { icon } from "#helpers/icons"

page = ({ name, title, hint, disabled }, value ) ->

  HTML.tag "vellum-field",
    name: name
    value: value
    disabled: disabled
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

        HTML.tag "sansa-select-page",
          name: "page"
          disabled: disabled
          exportparts: "L1:L2, L2:L3, L3:L4"

      ]
    ]

export { page }