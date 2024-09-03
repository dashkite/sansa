import * as Render from "@dashkite/rio-arriba/render"
import Enumerated from "../enumerated"

# TODO only render for layout?
subtype = ( value, data ) ->
  switch data.type
    when "layout"
      Render.field
        name: "subtype"
        label: "Type"
        hint: "The type of layout you want"
        type: "enum"
        options: Enumerated.layout
        required: true
        value: value

export { subtype }