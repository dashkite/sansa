import * as K from "@dashkite/katana/async"
import * as Obj from "@dashkite/joy/object"

normalize = K.poke ({ name, description, url }) ->
  if url?
    image = { url }
    { name, description, image }
  else
    { name, description }

denormalize = K.poke Obj.get "gadget"

export {
  normalize
  denormalize
}