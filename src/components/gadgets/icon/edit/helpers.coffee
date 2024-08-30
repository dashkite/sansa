import * as K from "@dashkite/katana/async"
import * as Format from "@dashkite/rio-arriba/format"
import Icons from "./icons"

# drop options and search term
reset = K.peek ( state ) ->
  state.icon = state.term
  delete state.term

normalize = K.poke ({ name, style, size, icon, term }) ->
  icon = term if Icons.match term
  icon = Format.dashed icon if icon?
  hints = { size, style }
  { name, hints, icon }

denormalize = K.poke ({ name, hints, icon, term }) ->
  { style, size } = hints
  if term?
    options = Icons.search term
    if options.length > 1
      options = options[..10]
    else
      options = undefined
  { name, style, size, icon, term, options }

export {
  reset
  normalize
  denormalize
}