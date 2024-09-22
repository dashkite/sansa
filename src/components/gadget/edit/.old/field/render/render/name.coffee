import * as Render from "@dashkite/rio-arriba/render"

name = ( value ) ->
  Render.field
    name: "name"
    label: "Name"
    hint: "A display name for the Gadget"
    type: "text"
    required: true
    value: value

export { name }