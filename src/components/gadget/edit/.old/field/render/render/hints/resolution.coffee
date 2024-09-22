import * as Render from "@dashkite/rio-arriba/render"
import { Gadget } from "@dashkite/talisa"

resolution = ( value ) ->
  Render.field
    name: "hints.resolution"
    label: "Resolution"
    hint: "Should the image be used with high-resolution displays?"
    type: "enum"
    options: Gadget.enumerated.resolution
    required: true
    value: value

export { resolution }
