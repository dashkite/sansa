import * as K from "@dashkite/katana/async"
import * as Fields from "./fields"

normalize = K.poke ( data ) -> Fields.normalize data

denormalize = K.poke ({ gadget, state, description }) ->
  {
    state, description
    gadget: Fields.denormalize gadget
  }

export {
  normalize
  denormalize
}