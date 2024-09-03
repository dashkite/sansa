import * as Render from "@dashkite/rio-arriba/render"
import Enumerated from "../enumerated"

# TODO only render for layout?
subtype = ( value ) ->
  Render.field
    name: "subtype"
    label: "Type"
    hint: "The type of layout you want"
    type: "enum"
    options: Enumerated.Layout
    required: true
    value: value

export { subtype }