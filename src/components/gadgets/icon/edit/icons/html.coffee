import HTML from "@dashkite/html-render"
import * as Format from "@dashkite/rio-arriba/format"

html = ({ icon, options, display, style }) ->
  HTML.div [
    HTML.input
      name: "icon"
      type: "text"
      value: icon
      autocomplete: "off"
    if display?
      HTML.i class: "ri-#{ display }-#{ style }"
    else if options?
      HTML.ul class: "suggestions", do ->
        for option in options
          HTML.li [
            HTML.i class: "ri-#{ option.name }-#{ style }"
            HTML.span Format.title option.name
          ]
  ]

export default html