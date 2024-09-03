import HTML from "@dashkite/html-render"
import * as Format from "@dashkite/rio-arriba/format"
import Fields from "./fields"

template = ({ description, gadget }) ->

  console.log { gadget }

  title = Format.title description.type

  HTML.form [

    HTML.slot name: "header", [
      HTML.header part: "header", [
        HTML.h1 "Edit #{ title }"
      ]
    ]

    HTML.div do ->
      for key, value of gadget when value?
        # TODO eventually this shouldn't need an existential check
        Fields[ key ]?.render value, gadget

  ]

export default template