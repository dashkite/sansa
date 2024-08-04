import * as K from "@dashkite/katana/async"
import { Gadgets } from "@dashkite/talisa"

normalize = K.poke ( data ) ->
  name: data.name
  hints: {}

denormalize = K.poke ({ name, hints }) ->
  { name }

export {
  normalize
  denormalize
}