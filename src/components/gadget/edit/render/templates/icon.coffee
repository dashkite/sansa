import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"

icon = ( key, specifier, { gadget }) ->

  value = gadget[ key ]
  style = gadget[ "hints.style" ]

  HTML.tag "vellum-field",
    name: key
    label: specifier.title ? Format.title key
    hint: specifier.hint ? "The icon to display"
    [

      HTML.div class: "preview", [
        HTML.i class: "ri-#{ value }-#{ style }"
      ]

      HTML.tag "sansa-select-icon"
        attributes:
          name: "icon"
          data: { style }
          exportparts: "L1:L2, L2:L3, L3:L4"

    ]

export { icon }