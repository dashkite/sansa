import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import Observable from "@dashkite/observable"
import Machine from "./machine"

Event =

  make: ( name ) -> 
    Fn.pipe [
      Ks.read "handle"
      K.mpop ( handle, context ) -> 
        handle.events.enqueue { name, context }
    ]

  from: Fn.pipe [
    Ks.read "handle"
    K.mpop ( handle, specifier ) -> 
      handle.events.enqueue specifier
  ]

Events =

  start: Ks.peek ( handle ) ->
    handle.state = Observable.from forward: [], back: []
    do -> handle.events = await Machine.start handle.state
    return

export { Event, Events }