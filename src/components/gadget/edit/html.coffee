import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import Fields from "./field"

template = ({ description, gadget, state }) ->

  title = Format.title description.type

  HTML.form [

    HTML.header part: "L1", [ HTML.h1 "Edit #{ title }" ]

    Fields.render { description, gadget, state }

  ]

export default template