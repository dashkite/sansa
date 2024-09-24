import * as Render from "@dashkite/rio-arriba/render"
import { Gadget } from "@dashkite/talisa"

width = ( value ) ->
  Render.field
    name: "hints.width"
    label: "Width"
    hint: "How much horizontal space the layout should consume"
    type: "range"
    value: value
    range: Gadget.enumerated.width

export { width }