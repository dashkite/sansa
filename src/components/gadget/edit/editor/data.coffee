import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana"
import { normalize, denormalize } from "../transform"

Data =
  normalize: K.poke Fn.binary normalize
  denormalize: K.poke Fn.unary denormalize

export default Data