import * as K from "@dashkite/katana/async"
import { Gadgets } from "@dashkite/talisa"
import * as Format from "@dashkite/rio-arriba/format"
import Icons from "./icons"

normalize = K.poke ({ name, style, icon, hints }) ->  
  icon = Format.dashed icon if icon?
  { name, style, icon, size: hints?.size }

denormalize = K.poke ({ name, style, icon, size }) ->
  if icon?
    if Icons.match icon
      display = icon
    else if ( icon?.length >= 3 )
      options = Icons.search icon
      if options.length > 1
        options = options[..10]
      else
        options = undefined
    icon = Format.title icon
  { name, style, icon, display, options, hints: { size }}

export {
  normalize
  denormalize
}