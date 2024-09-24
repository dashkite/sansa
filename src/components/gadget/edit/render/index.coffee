import Generic from "@dashkite/generic"
import * as Templates from "./templates"
import Schema from "../schema"

render = Generic.make "render"

  .define [ Object ], ({ context..., data }) ->
    for field in ( Schema.get data )
      template = Templates[ specifier.type ] ? Templates.field
      template field, { context..., data }
    # avoid returning comprehension
    return

export default render