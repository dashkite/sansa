import * as Text from "@dashkite/joy/text"

Transitions =

  home:
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        Object.assign state, context

  "select color input":
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        Object.assign state, context

  "select color":
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        Object.assign state, context

  "select image":
    run: ( talos, { context }) ->

  "select family":
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        Object.assign state, context

  "select intensity":
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        Object.assign state, context

  "select gradient":
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        Object.assign state, context

  "select scheme":
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        Object.assign state, context

export default Transitions