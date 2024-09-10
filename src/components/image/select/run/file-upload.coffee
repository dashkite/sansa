import * as Fn from "@dashkite/joy/function"
import * as Format from "@dashkite/rio-arriba/format"

fileUpload = ( talos, { name, context: { url }}) ->
  # In theory, we should do something with the URL, I think?
  talos.context.state.update Fn.tee ( state ) ->
    state.name = name
    state.title = Format.title name

export { fileUpload }