import * as Render from "@dashkite/rio-arriba/render"
import { Gadget } from "@dashkite/talisa"

justification = ( value ) ->
  Render.field
    name: "hints.justification"
    label: "Justification"
    hint: "How are gadgets placed along the axis"
    type: "enum"
    options: Gadget.enumerated.justification
    required: true
    value: value

export { justification }