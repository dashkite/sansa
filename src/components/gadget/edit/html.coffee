import HTML from "@dashkite/html-render"
import * as Format from "@dashkite/rio-arriba/format"
import Fields from "./fields"
import Schema from "./schema"

template = ({ description, gadget, state }) ->

  title = Format.title description.type

  HTML.form [

    HTML.header part: "L1", [
      HTML.h1 "Edit #{ title }"
    ]

    HTML.div do ->
      if ( schema = Schema[ gadget.type ])?
        for key in schema
          if ( specifier = Fields[ key ])?
            specifier.render gadget[ key ], 
              { description, gadget, state }
          else
            console.warn "gadget.edit: unknown field [ #{ key } ]"
      else
        console.warn "gadget.edit: unknown type [ #{ gadget.type } ]"

  ]

export default template