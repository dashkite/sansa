import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import render from "../render"

template = ({ data, gadget, state }) ->

  title = Format.title gadget.type

  HTML.form [

    HTML.header part: "L1", [ HTML.h1 "Edit #{ title }" ]

    HTML.div render { data, gadget, state }

  ]

export default template