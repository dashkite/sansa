import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import render from "../render"

template = ({ context..., data }) ->

  title = Format.title data.type

  HTML.form [

    HTML.header part: "L1", [ HTML.h1 "Edit #{ title }" ]

    HTML.div render { context..., data }

  ]

export default template