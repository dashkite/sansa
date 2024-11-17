import * as Type from "@dashkite/joy/type"
import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"
import Fonts from "#helpers/fonts"

fonts = ({ name, title, hint }, value, data ) ->
  { heading, copy, base } = Fonts[ data["brief.fonts"] ]

  [

    HTML.tag "vellum-field",
      name: name
      type: "range"
      required: true
      value: value
      minimum: 0
      maximum: Fonts.length
      [
        HTML.span slot: "label", title ? Format.title name
        if hint? then HTML.span slot: "hint", hint
      ]

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
  


export { fonts }