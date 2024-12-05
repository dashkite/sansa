import * as Fn from "@dashkite/joy/function"
import * as Templates from "./templates"
import schema from "../schema"

# TODO reimplement transforms, ex: disable fields
# ( field, gadget ) -> 
#   # compute disabled using gadget
#   { field..., disabled }

Transforms = {}

render = ({ data, gadget, state }) ->
  for field in ( schema gadget )
    do ({ template, transform, value } = {}) ->
      template = Templates[ field.type ] ? Templates.basic
      transform = Transforms[ gadget.type ] ? Fn.identity
      field = transform field, gadget
      value = data[ field.name ]
      # TODO covert this into a context 😅
      template field, value, data, state

export default render