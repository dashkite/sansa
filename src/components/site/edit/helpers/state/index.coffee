import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import { Daisho } from "@dashkite/katana"
import { Gadgets } from "@dashkite/talisa"
import Mock from "./mock"
import Observable from "@dashkite/rio-observable"
import Registry from "@dashkite/rio-helium"

import initial from "./initial"

State =

  initialize: Fn.flow [
    Registry.get "sansa.editor.state"
    Observable.update [
      Mock.initialize
      K.poke ({ site }, state ) ->
        site.title = site.name
        gadgets = Gadgets.from site.branches.main
        { site, gadgets, initial..., state... }
    ]
  ]

  load: Fn.flow [
    Registry.get "sansa.editor.state"
    Observable.get
  ]

  update: ( fx ) ->
    Fn.flow [
      Registry.get "sansa.editor.state"
      Observable.update fx
    ]

  observe: ( fx ) ->
    Fn.flow [
      Registry.get "sansa.editor.state"
      Observable.observe fx
    ]

  cancel: Observable.cancel

  assign: Fn.flow [
    Registry.get "sansa.editor.state"
    Observable.assign
  ]

  pop: Fn.flow [
    Registry.get "sansa.editor.state"
    Observable.pop
  ]

export { State }
export default State