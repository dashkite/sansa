import * as Render from "@dashkite/rio-arriba/render"
import { Gadget } from "@dashkite/talisa"

alignment = ( value ) ->
  Render.field
    name: "hints.alignment"
    label: "Alignment"
    hint: "How are gadgets placed along the cross axis"
    type: "enum"
    options: Gadget.enumerated.alignment
    required: true
    value: value

export { alignment }