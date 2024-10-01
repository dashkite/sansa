import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"

icon = ({ name, title, hint }, value, data ) ->

  style = data[ "hints.style" ]

  HTML.tag "vellum-field",
    name: name
    [
      HTML.span slot: "label", title ? Format.title name
      HTML.span slot: "hint", hint
      HTML.div slot: "input", [

        HTML.div class: "preview", [
          HTML.i class: "ri-#{ value }-#{ style }"
        ]

      HTML.tag "sansa-select-icon",
        name: "icon"
        data: { style }
        exportparts: "L1:L2, L2:L3, L3:L4"

      ]
    ]

export { icon }
