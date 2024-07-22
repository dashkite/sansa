import * as K from "@dashkite/katana/async"
import { Gadgets } from "@dashkite/talisa"

gadget = K.poke ({ gadgets, selected }) ->
  Gadgets.find selected, gadgets

export default {
  gadget
}