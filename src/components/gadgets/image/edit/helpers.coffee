import * as K from "@dashkite/katana/async"
import { Gadgets } from "@dashkite/talisa"
import * as Fn from "@dashkite/joy/function"

normalize = K.poke Fn.identity

denormalize = K.poke Fn.identity

# TODO we have this all over the place
#      need to figure out how to normalize this
find = ({ key }, state ) ->
  Gadgets.find key, state.gadgets

export {
  normalize
  denormalize
  find
}