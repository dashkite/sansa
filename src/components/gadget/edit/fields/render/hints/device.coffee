import * as Render from "@dashkite/rio-arriba/render"
import { Gadget } from "@dashkite/talisa"

# TODO support multiple selection
device = ( value ) ->
  Render.field
    name: "hints.device"
    label: "Device"
    hint: "Is the image optimized for specific devices?"
    type: "enum"
    options: Gadget.enumerated.device
    required: true
    value: value

exports { device }
