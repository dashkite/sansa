import * as Render from "@dashkite/rio-arriba/render"
import Enumerated from "../../enumerated"

size = ( value ) ->
  Render.field
    name: "size"
    label: "Size"
    hint: "How large or small are fonts and icons?"
    type: "range"
    value: value
    range: Enumerated.size

export { size }