import * as Render from "@dashkite/rio-arriba/render"
import { Gadget } from "@dashkite/talisa"

size = ( value ) ->
  Render.field
    name: "hints.size"
    label: "Size"
    hint: "How large or small are fonts and icons?"
    type: "range"
    value: value
    range: Gadget.enumerated.size

export { size }