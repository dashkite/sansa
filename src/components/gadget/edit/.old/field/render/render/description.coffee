import * as Render from "@dashkite/rio-arriba/render"

description = ( value, data ) ->
  Render.field
    name: "description"
    label: "Description"
    hint: "A description of the #{ data.type }. 
      Helpful for SEO and accessibility."
    type: "text"
    subtype: "prose"
    value: value

export { description }