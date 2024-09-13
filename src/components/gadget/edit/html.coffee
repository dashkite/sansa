import HTML from "@dashkite/html-render"
import * as Format from "@dashkite/rio-arriba/format"
import Fields from "./fields"

properties = [
  "name"
  "subtype"
  "description"
  "text"
  "image.url"
  "icon"
  "hints.wrap"
  "hints.alignment"
  "hints.justification"
  "hints.orientation"
  "hints.proximity"
  "hints.size"
  "hints.width"
]

template = ({ description, gadget, state }) ->

  title = Format.title description.type

  HTML.form [

    HTML.header part: "L1", [
      HTML.h1 "Edit #{ title }"
    ]

    HTML.div do ->
      for key in properties
        if ( value = gadget[ key ])? && ( specifier = Fields[key])?
          specifier.render value, { description, gadget, state }

  ]

export default template