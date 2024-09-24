import * as Render from "@dashkite/rio-arriba/render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"

Enumerable = Gadget.enumerable

enumerable = ( key, specifier, { gadget }) ->
  
  options = Enumerable[ specifier.options ] ?
    Enumerable[ gadget.type ]?[ key ]
  
  HTML.tag "vellum-field",
    name: key
    label: specifier.title ? Format.title key
    hint: specifier.hint
    type: "range"
    range: options
    required: true
    value: gadget[ key ]

export { enumerable }