import * as Text from "@dashkite/joy/text"
import Fonts from "#helpers/fonts"

Transitions =

  initialize:
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) -> 
        Object.assign state, context

  browse:
    run: ( talos, { context: index }) ->
      talos.context.state.plan ( state ) ->
        state.index = index
        state

  pin:
    run: ( talos, { context: { name, action } }) ->
      console.log { action }
      talos.context.state.plan ( state ) ->
        state.pinned[ name ] = action == "pin"
        state

export default Transitions