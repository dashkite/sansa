import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"

Enumerable = Gadget.enumerable

enumerable = ({ name, title, hint, options }, value ) ->
    
  HTML.tag "vellum-field",
    name: name
    type: "enumerable"
    required: true
    value: value
    [
      HTML.span slot: "label", title ? Format.title name
      HTML.span slot: "hint", hint
      HTML.datalist do ->
        for option in Enumerable[ options ]
          HTML.option value: option, Format.title option
      
    ]

export { enumerable }