import HTML from "@dashkite/html-render"

template = ( context ) ->

  HTML.render [
    HTML.slot name: "header", [
      HTML.header part: "header", [
        HTML.h1 "Sites"
      ]
    ]
  ]

export default template