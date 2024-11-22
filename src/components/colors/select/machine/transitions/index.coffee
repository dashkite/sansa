import * as Text from "@dashkite/joy/text"

Transitions =

  home:
    run: ( talos, { context }) ->

  "select color input":
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        Object.assign state, context

  "select color":
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        Object.assign state, context

  "select image":
    run: ( talos, { context: index }) ->
      talos.context.state.plan ( state ) ->
        Object.assign state, name: "select image"

  "select family":
    run: ( talos, { context: index }) ->
      talos.context.state.plan ( state ) ->
        state

  "select palette":
    run: ( talos, { context: index }) ->
      talos.context.state.plan ( state ) ->
        state

  "select intensity":
    run: ( talos, { context: index }) ->
      talos.context.state.plan ( state ) ->
        state

  "select gradient":
    run: ( talos, { context: index }) ->
      talos.context.state.plan ( state ) ->
        state

export default Transitions