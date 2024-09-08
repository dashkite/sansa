import * as Fn from "@dashkite/joy/function"
# generic transition action
import * as Format from "@dashkite/rio-arriba/format"

generate = ( name ) ->
  ( talos ) ->
    console.log { talos }
    talos.context.state.update Fn.tee ( state ) ->
      state.name = name
      state.title = Format.title name

export { generate }