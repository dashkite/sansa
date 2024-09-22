import * as Render from "@dashkite/rio-arriba/render"
import { Gadget } from "@dashkite/talisa"

wrap = ( value ) ->
  Render.field
    name: "hints.wrap"
    label: "Wrap"
    hint: "Whether items wrap if they overflow the layout"
    type: "boolean"
    value: value

export { wrap }