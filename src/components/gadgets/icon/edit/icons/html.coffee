import HTML from "@dashkite/html-render"
import * as Format from "@dashkite/rio-arriba/format"
import "@dashkite/vellum"

html = ({ style, term, options }) ->

  HTML.div [

    HTML.tag "vellum-field",
      name: "term"
      type: "custom"
      value: term
      [
        HTML.div slot: "input", [
          HTML.tag "vellum-autocomplete",
            name: "term"
            value: term
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