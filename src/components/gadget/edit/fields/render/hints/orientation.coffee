import * as Render from "@dashkite/rio-arriba/render"
import { Gadget } from "@dashkite/talisa"

orientation = ( value ) ->
  Render.field
    name: "hints.orientation"
    label: "Orientation"
    hint: "The direction in which items flow within the layout"
    type: "enum"
    options: Gadget.enumerated.orientation
    required: true
    value: value

export { orientation }