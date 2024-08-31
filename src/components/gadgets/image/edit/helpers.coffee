import * as K from "@dashkite/katana/async"
import * as Fn from "@dashkite/joy/function"

normalize = K.poke ({ name, description, url }) ->
  console.log { url }
  if url?
    image = { url }
    { name, description, image }
  else
    { name, description }

denormalize = Fn.identity

# TODO we have this all over the place
#      need to figure out how to normalize this
find = ({ key }, state ) -> state.gadgets.get key

export {
  normalize
  denormalize
  find
}