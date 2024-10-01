import * as Type from "@dashkite/joy/type"
import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"
import Messages from "#helpers/messages"

format = ( text ) ->
  if ( Messages.has text )
    Messages.expand text
  else Format.title text

Enumerable = Gadget.enumerable

enumerable = ({ name, title, hint, options }, value ) ->
    
  HTML.tag "vellum-field",
    name: name
    type: "enumerable"
    required: true
    value: value
    [
      HTML.span slot: "label", title ? Format.title name
      if hint? then HTML.span slot: "hint", hint
      HTML.datalist slot: "options", do ->
        for option in Enumerable[ options ]
          HTML.option value: option, label: format option
    ]

export { enumerable }