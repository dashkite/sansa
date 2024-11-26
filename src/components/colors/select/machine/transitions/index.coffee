import * as Text from "@dashkite/joy/text"
import { schemes } from "./schemes"

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
        # TODO incorporate both dark and light somehow
        state.schemes = do ->
          _schemes = schemes state
          for _scheme, i in _schemes.dark
            background: _scheme.background.toString()
            foreground: _scheme.foreground.toString()
            highlight: _scheme.highlight.toString()
        state

  "select image":
    run: ( talos, { context }) ->

  "select family":
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        Object.assign state, context

  "select palette":
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