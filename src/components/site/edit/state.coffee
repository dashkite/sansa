import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import Mock from "./mock"
import Registry from "@dashkite/helium"

State =

  initialize: Fn.flow [
    Mock.initialize
    K.poke ({ site }) ->
      gadgets = site.branches.main
      open = [ "home" ]
      selected = "home/splash"
      editor = action: "edit", type: "layout"
      { site, gadgets, open, selected, editor }
    # protect forward reference
    ( state ) -> State.save state 
  ]

  save: K.peek ( state ) ->
    Registry.set sansa: editor: { state }

export { State }
export default State