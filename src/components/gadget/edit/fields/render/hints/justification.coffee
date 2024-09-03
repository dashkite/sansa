import * as Render from "@dashkite/rio-arriba/render"
import Enumerated from "../../enumerated"

justification = ( value ) ->
  Render.field
    name: "justification"
    label: "Justification"
    hint: "How are gadgets placed along the axis"
    type: "enum"
    options: Enumerated.justification
    required: true
    value: value

export { justification }