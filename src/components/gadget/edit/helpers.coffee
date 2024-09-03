import * as K from "@dashkite/katana/async"
import Fields from "./fields"

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