import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana"
import { normalize, denormalize } from "../transform"

Data =
  normalize: K.poke Fn.unary normalize
  denormalize: K.poke Fn.unary denormalize

export default Data