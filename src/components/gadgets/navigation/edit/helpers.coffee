import * as K from "@dashkite/katana/async"
import * as Fn from "@dashkite/joy/function"

normalize = K.poke Fn.identity

denormalize = K.poke Fn.identity

export {
  normalize
  denormalize
}