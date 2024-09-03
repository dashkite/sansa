import * as Render from "@dashkite/rio-arriba/render"
import Enumerated from "../../enumerated"

orientation = ( value ) ->
  Render.field
    name: "orientation"
    label: "Orientation"
    hint: "The direction in which items flow within the layout"
    type: "enum"
    options: Enumerated.orientation
    required: true
    value: value

export { orientation }