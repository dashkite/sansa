import * as Render from "@dashkite/rio-arriba/render"
import Enumerated from "../../enumerated"

alignment = ( value ) ->
  Render.field
    name: "hints.alignment"
    label: "Alignment"
    hint: "How are gadgets placed along the cross axis"
    type: "enum"
    options: Enumerated.alignment
    required: true
    value: value

export { alignment }