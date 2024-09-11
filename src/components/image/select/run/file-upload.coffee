import * as Fn from "@dashkite/joy/function"
import * as Format from "@dashkite/rio-arriba/format"

fileUpload = ( talos, { name, context: { url }}) ->
  # In theory, we should do something with the URL, I think?
  title = Format.title name
  talos.context.updates.push ( state ) ->
    Object.assign state, { name, title }

export { fileUpload }