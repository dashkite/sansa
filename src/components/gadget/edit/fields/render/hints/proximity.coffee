import * as Render from "@dashkite/rio-arriba/render"
import { Gadget } from "@dashkite/talisa"

proximity = ( value ) ->
  Render.field
    name: "hints.proximity"
    label: "Proximity"
    hint: "How much space exists between gadgets"
    type: "range"
    value: value
    range: Gadget.enumerated.proximity

export { proximity }