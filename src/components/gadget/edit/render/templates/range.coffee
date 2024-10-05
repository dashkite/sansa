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

range = ({ name, title, hint, options }, value ) ->
  
  HTML.tag "vellum-field",
    name: name
    type: "range"
    required: true
    value: value
    [

      HTML.span slot: "label", title ? Format.title name

      if hint? then HTML.span slot: "hint", hint

      if options?
        HTML.datalist slot: "options", id: "#{ name }-list", do ->
          for option, index in Enumerable[ options ]
            HTML.option value: index, label: format option

    ]


export { range }