import HTML from "@dashkite/html-render"
import * as Format from "@dashkite/rio-arriba/format"
import "@dashkite/vellum"

html = ({ icon, options, display, style }) ->
  HTML.tag "vellum-autocomplete",
    name: "icon"
    value: icon
    data: state: if options? then "open" else "closed"
    if display?
      [
        HTML.i 
          slot: "preview"
          class: "ri-#{ display }-#{ style }"
      ]
    else if options?
      for option in options
        HTML.div slot: "option", [
          HTML.i class: "ri-#{ option.name }-#{ style }"
          HTML.span Format.title option.name
        ]

export default html