import Generic from "@dashkite/generic"
import HTML from "@dashkite/html-render"
import Types from "./types"
import * as Specifier from "./specifier"
import * as Render from "./render"

render = Generic.make "Field.render"
  .define [ String, Object, Object ], Render.field
  .define [ String, Specifier.forImage, Object ], Render.image
  .define [ String, Specifier.forPage, Object ], Render.page
  .define [ String, Specifier.forEnumerable, Object ], Render.enumerable
  .define [ String, Object ], ( key, context ) ->
    render key, Types[ key ], context

export default render