import * as K from "@dashkite/katana/async"

normalize = K.poke ({ name, description, theme }) ->
  { 
    name, description, theme
    hints: {}
  }

denormalize = K.poke ({ name, description, theme, hints }) ->
  { name, description, theme }

export {
  normalize
  denormalize
}