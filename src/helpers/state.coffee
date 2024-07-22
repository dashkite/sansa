import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import { Daisho } from "@dashkite/katana"
import Mock from "./mock"
import Registry from "@dashkite/helium"
import observe from "#helpers/observe"

State =

  initialize: Fn.flow [
    Mock.initialize
    K.poke ({ site }) ->
      gadgets = site.branches.main
      open = [ "home" ]
      selected = "home/splash"
      editor = action: "edit", type: "layout"
      observe { site, gadgets, open, selected, editor }
    # protect forward reference
    ( state ) -> State.save state 
  ]

  save: K.peek ( state ) ->
    Registry.set sansa: editor: { state }

  load: K.push ->
    Registry.get "sansa.editor.state"

  observe: ( fx ) ->
    Ks.peek ( handle ) ->
      handler = Fn.flow fx
      # don't await on promise
      # TODO maybe change the autoconversion in katana?
      do ->
        state = await Registry.get "sansa.editor.state"
        observe state, -> 
          handler Daisho.create [ state, handle ], { handle }
        # fire the first time that we set it
        handler Daisho.create [ state, handle ], { handle }
      return

  assign: K.peek ( data ) ->
    state = await Registry.get "sansa.editor.state"
    Object.assign state, data


export { State }
export default State