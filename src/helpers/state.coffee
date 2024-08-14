import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import { Daisho } from "@dashkite/katana"
import Mock from "./mock"
import Registry from "@dashkite/helium"
import observe from "#helpers/observe"

# TODO find a way to avoid placing this in the closure
observable = undefined

State =

  initialize: Fn.flow [
    Mock.initialize
    K.poke ({ site }) ->
      site.title = site.name
      gadgets = site.branches.main
      open = [ "home", "home/main" ]
      selected = "home/main/splash"
      editor = action: "edit", type: "layout"
      observe { site, gadgets, open, selected, editor }
    # protect forward reference
    ( daisho ) -> State.save daisho 
  ]

  save: K.peek ( state ) -> Registry.set sansa: editor: { state }

  load: K.push -> 
    observable = await Registry.get "sansa.editor.state"
    observable.get()

  update: ( fx ) ->
    mutator = Fn.flow fx
    ( daisho ) ->
      observable = await Registry.get "sansa.editor.state"
      observable.update ( data ) ->
        daisho.push data
        daisho = await mutator daisho
        do daisho.pop
      daisho

  observe: ( fx ) ->
    Ks.peek ( handle ) ->
      handler = Fn.flow fx
      # don't await on promise
      # TODO maybe change the autoconversion in katana?
      do ->
        observable = await Registry.get "sansa.editor.state"
        # TODO use return value of observe to cancel
        handle.observer = observe observable, ( state ) -> 
          handler Daisho.create [ state, handle ], { handle }
        # fire the first time that we set it
        state = observable.get()
        handler Daisho.create [ state, handle ], { handle }
      return

  cancel: Ks.peek ( handle ) ->
    # observable = await Registry.get "sansa.editor.state"
    observable.cancel handle.observer

  assign: K.peek ( data ) ->
    observable = await Registry.get "sansa.editor.state"
    observable.update ( state ) ->
      Object.assign state, data

  pop: K.push ->
    observable = await Registry.get "sansa.editor.state"
    observable.pop()

export { State }
export default State