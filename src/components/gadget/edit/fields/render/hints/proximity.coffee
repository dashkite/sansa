import * as Render from "@dashkite/rio-arriba/render"
import Enumerated from "../../enumerated"

proximity = ( value ) ->
  Render.field
    name: "hints.proximity"
    label: "Proximity"
    hint: "How much space exists between gadgets"
    type: "range"
    value: value
    range: Enumerated.proximity

export { proximity }