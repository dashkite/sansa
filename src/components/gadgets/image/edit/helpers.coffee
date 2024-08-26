import * as K from "@dashkite/katana/async"
import * as Fn from "@dashkite/joy/function"

normalize = K.poke Fn.identity

denormalize = K.poke Fn.identity

# TODO we have this all over the place
#      need to figure out how to normalize this
find = ({ key }, state ) -> state.gadgets.get key

export {
  normalize
  denormalize
  find
}