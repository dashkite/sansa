import * as Text from "@dashkite/joy/text"

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
      talos.context.state.plan ( state ) ->
        state.pinned[ name ] = action == "pin"
        state

  filter:
    run: ( talos, { context: { name, value }}) ->
      talos.context.state.plan ( state ) ->
        state.filters[ name ] = value
        state
      
export default Transitions