import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"

Enumerable = Gadget.enumerable

range = ({ name, title, hint, options }, value ) ->
  
  HTML.tag "vellum-field",
    name: name
    type: "range"
    required: true
    value: value
    [
      HTML.span slot: "label", title ? Format.title name
      if hint? then HTML.span slot: "hint", hint
      HTML.datalist id: "#{ name }-list", slot: "options", do ->
        for option, index in Enumerable[ options ]
          HTML.option value:  index, label: Format.title option
    ]


export { range }