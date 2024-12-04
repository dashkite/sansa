import * as Text from "@dashkite/joy/text"

assign = ( context ) -> ( state ) -> Object.assign state, context

Transitions =

  home:
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        # home is our initilaization, so our state
        # if it exists, comes frmo the DOM value,
        # while the context is the default state.
        # thus we overwrite the default with any
        # values we get from the DOM. this is
        # the reverse of the transitions driven
        # by events (all the rest of them)
        Object.assign context, state

  "select color input":
    run: ( talos, { context }) ->
      talos.context.state.plan assign context

  "select color":
    run: ( talos, { context }) ->
      talos.context.state.plan assign context

  "select image":
    run: ( talos, { context }) ->

  "select family":
    run: ( talos, { context }) ->
      talos.context.state.plan assign context

  "select intensity":
    run: ( talos, { context }) ->
      talos.context.state.plan assign context

  "select gradient":
    run: ( talos, { context }) ->
      talos.context.state.plan assign context

  "select background":
    run: ( talos, { context }) ->
      talos.context.state.plan assign context

export default Transitions