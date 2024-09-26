import Generic from "@dashkite/generic"
import * as Templates from "./templates"
import schema from "../schema"

Link =

  isType: ({ gadget }) -> gadget.type == "link"

  isDisabled: ( gadget ) ->
    ( field ) ->
      switch field.name
        when "url" then !( gadget.subtype == "external" )
        when "page" then !( gadget.subtype == "internal" )
        else false

render = Generic.make "render"

  .define [ Object ], ({ data, gadget }) ->
    for field in ( schema gadget )
      template = Templates[ field.type ] ? Templates.field
      template field, data[ field.name ]

  .define [ Link.isType ], ({ data, gadget }) ->
    isDisabled = Link.isDisabled gadget
    for field in ( schema gadget )
      template = Templates[ field.type ] ? Templates.field
      disabled = isDisabled field
      template { field..., disabled }, data[ field.name ]

export default render