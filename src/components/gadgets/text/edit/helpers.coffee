import * as K from "@dashkite/katana/async"
import { Gadgets } from "@dashkite/talisa"

normalize = K.poke ({ name, text }) ->
  { name, text }

denormalize = K.poke ({ name, text }) ->
  { name, text }

export {
  normalize
  denormalize
}