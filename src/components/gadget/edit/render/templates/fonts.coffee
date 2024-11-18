import * as Type from "@dashkite/joy/type"
import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"
import Fonts from "#helpers/fonts"

fonts = ({ name, title, hint }, value ) ->

  HTML.tag "vellum-field",
    name: name
    [
      
      HTML.span slot: "label", title ? Format.title name
      
      if hint? then HTML.span slot: "hint", hint
    
      HTML.div slot: "input", [

        HTML.tag "sansa-select-fonts",
          value: value
          exportparts: "L1:L2, L2:L3, L3:L4"

      ]

    ]
  


export { fonts }