import * as Fn from "@dashkite/joy/function"
import * as Templates from "./templates"
import schema from "../schema"


Transforms = {}

render = ({ data, gadget, state }) ->
  for field in ( schema gadget )
    do ({ template, transform, value } = {}) ->
      template = Templates[ field.type ] ? Templates.basic
      transform = Transforms[ gadget.type ] ? Fn.identity
      field = transform field, gadget
      value = data[ field.name ]
      template field, value, data, state

export default render