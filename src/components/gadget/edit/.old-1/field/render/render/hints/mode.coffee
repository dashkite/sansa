import * as Render from "@dashkite/rio-arriba/render"
import { Gadget } from "@dashkite/talisa"

mode = ( value ) ->
  Render.field
    name: "hints.mode"
    label: "Mode"
    hint: "Should the image be used for light or dark mode?"
    type: "enum"
    options: Gadget.enumerated.mode
    required: true
    value: value

export { mode }