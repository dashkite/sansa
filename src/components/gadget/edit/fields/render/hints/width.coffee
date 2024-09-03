import * as Render from "@dashkite/rio-arriba/render"
import Enumerated from "../../enumerated"

width = ( value ) ->
  Render.field
    name: "width"
    label: "Width"
    hint: "How much horizontal space the layout should consume"
    type: "range"
    value: value
    range: Enumerated.width

export { width }