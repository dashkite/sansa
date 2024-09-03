import * as Fn from "@dashkite/joy/function"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Format from "@dashkite/rio-arriba/format"
import Icons from "./icons"

# drop options and search term
# once we select an icon...
# here, `state` refers to the editor state
reset = K.peek ( state ) ->
  if state.term? && state.term != ""
    state.icon = state.term
    state.term = ""

normalize = K.poke ({ name, style, size, icon, term }) ->
  icon = term if Icons.match term
  icon = Format.dashed icon if icon?
  hints = { size, style }
  { name, hints, icon }

denormalize = K.poke ({gadget: { name, hints, icon, term }}) ->
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