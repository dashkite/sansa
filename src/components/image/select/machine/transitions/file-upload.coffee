import * as Fn from "@dashkite/joy/function"
import * as Format from "@dashkite/rio-arriba/format"

run = ( talos, { name, context: { url }}) ->
  # In theory, we should do something with the URL, I think?
  title = Format.title name
  talos.context.state.plan ( state ) ->
    Object.assign state, { name, title }

export { run }