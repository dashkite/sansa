import HTML from "@dashkite/html-render"
import * as Format from "@dashkite/rio-arriba/format"
import "@dashkite/vellum"

html = ({ icon, options, display, style }) ->

  HTML.div [

    HTML.div class: "preview", [
      if display?
        HTML.i class: "ri-#{ display }-#{ style }"
    ]

    HTML.tag "vellum-field",
      name: "icon"
      type: "custom"
      value: icon
      required: true
      [
        HTML.div slot: "input", [
          HTML.tag "vellum-autocomplete",
            name: "icon"
            value: icon
            data: state: if options? then "open" else "closed"
            if options?
              for option in options
                HTML.div slot: "option", data: value: option.name, [
                  HTML.i class: "ri-#{ option.name }-#{ style }"
                  HTML.span Format.title option.name
                ]
        ]
        HTML.span slot: "label", "Search Icons"
        HTML.span slot: "hint", "Search the icons from Remixicon"   
      ]

  ]
    



export default html