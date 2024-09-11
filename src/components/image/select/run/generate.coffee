import * as Fn from "@dashkite/joy/function"
# generic transition action
import * as Format from "@dashkite/rio-arriba/format"

generate = ( name ) ->
  ( talos ) ->
    title = Format.title name
    talos.context.updates.push ( state ) ->
      Object.assign state, { name, title }

export { generate }