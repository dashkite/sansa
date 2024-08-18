import * as K from "@dashkite/katana/async"
import { Gadgets } from "@dashkite/talisa"
import Icons from "./icons"

normalize = K.poke ({ name, style, icon, term, hints }) ->  
  icon = Format.dashed icon if icon?
  { name, style, icon, term, size: hints?.size }

denormalize = K.poke ({ name, style, icon, term, size }) ->
  if term?
    console.log { term, match: ( Icons.match term )}
    if Icons.match term
      icon = term
    options = Icons.search term
    if options.length > 1
      options = options[..10]
    else
      options = undefined
  { name, style, icon, term, options, hints: { size }}

export {
  normalize
  denormalize
}