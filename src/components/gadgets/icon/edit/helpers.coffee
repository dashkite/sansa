import * as K from "@dashkite/katana/async"
import * as Format from "@dashkite/rio-arriba/format"
import Icons from "./icons"

normalize = K.poke ({ name, style, size, icon }) ->
  icon = Format.dashed icon if icon?
  hints = { size, style }
  { name, hints, icon }

denormalize = K.poke ({ name, hints, icon, term }) ->
  { style, size } = hints
  console.log { term }
  if term?
    console.log match: Icons.match term
    if Icons.match term
      icon = term
    options = Icons.search term
    if options.length > 1
      options = options[..10]
    else
      options = undefined
  { name, style, size, icon, term, options }

export {
  normalize
  denormalize
}