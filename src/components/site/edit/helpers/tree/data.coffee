import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import * as Format from "@dashkite/rio-arriba/format"
import { Gadget, Gadgets } from "@dashkite/talisa"

Data =
  key: K.poke ( target ) -> target.dataset.key

export default Data