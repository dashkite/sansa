import * as Render from "@dashkite/rio-arriba/render"
import Enumerated from "../../enumerated"

wrap = ( value ) ->
  Render.field
    name: "wrap"
    label: "Wrap"
    hint: "Whether items wrap if they overflow the layout"
    type: "boolean"
    value: value

export { wrap }