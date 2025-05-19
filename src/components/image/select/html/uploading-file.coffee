import HTML from "@dashkite/domo"

template = ({ completion }) ->

  HTML.label [
    HTML.span "Uploading&hellip;"
    HTML.progress max: "100", value: completion
  ]

export default template
