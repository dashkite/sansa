import * as Type from "@dashkite/joy/type"
import * as Text from "@dashkite/joy/text"
import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"
import Fonts from "#helpers/fonts"

template = ({ value }) ->

  { heading, copy, base } = Fonts[ Text.parseNumber value ]

  HTML.main [

    HTML.input
      name: "index"
      type: "range"
      value: value
      min: 0
      max: Fonts.length - 1

    HTML.p [
      HTML.span "Base&nbsp;"
      HTML.a href: "https://fonts.google.com/specimen/#{ base }", base
    ]

    HTML.p [
      HTML.span "Heading&nbsp;"
      HTML.a href: "https://fonts.google.com/specimen/#{ heading }", heading
    ]
  
    HTML.p [
      HTML.span "Copy&nbsp;"
      HTML.a href: "https://fonts.google.com/specimen/#{ copy }", copy
    ]

  ]
  


export default template 