import * as K from "@dashkite/katana/async"
import * as Fn from "@dashkite/joy/function"

normalize = K.poke ({ specifier..., style, window }) ->
  hints = { style, window }
  { specifier..., hints }

denormalize = K.poke ({ specifier..., hints: { style, window }}) ->
  { specifier, style, window }

export {
  normalize
  denormalize
}