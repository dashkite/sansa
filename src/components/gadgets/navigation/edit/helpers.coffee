import * as K from "@dashkite/katana/async"
import { Gadgets } from "@dashkite/talisa"
import * as Fn from "@dashkite/joy/function"

normalize = K.poke Fn.identity

denormalize = K.poke Fn.identity

export {
  normalize
  denormalize
}