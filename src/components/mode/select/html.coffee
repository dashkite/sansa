import HTML from "@dashkite/domo"
import icon from "#helpers/icons"

template = ({ mode }) ->
  HTML.main [
    HTML.label [
      HTML.span "Mode"
      if mode == "dark"
        icon "moon"
      else if mode == "light"
        icon "sun"
    ]
  ]

export default template