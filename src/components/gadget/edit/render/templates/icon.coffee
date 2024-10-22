import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"
import { render } from "@dashkite/talisa-render"

icon = ({ name, title, hint }, value, data ) ->

  style = data[ "brief.style" ]

  HTML.tag "vellum-field",
    name: name
    [
      HTML.span slot: "label", title ? Format.title name
      HTML.span slot: "hint", hint
      HTML.div slot: "input", [

        HTML.div class: "preview", [
          if value?
            render Gadget.make
              type: "icon"
              brief: { style, icon: value }
          else
            HTML.span "No icon selected"
        ]

        HTML.tag "sansa-select-icon",
          name: name
          # value: value
          data: { style }
          exportparts: "L1:L2, L2:L3, L3:L4"

      ]
    ]

export { icon }
