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
    K.mpop ( handle, context ) -> 
      handle.events.enqueue { name, context }
  ]

Events =

  start: Ks.peek ( handle ) ->
    console.log "Event.start": handle.events
    handle.state = Observable.from {}
    do -> handle.events = await Machine.start handle.state
    return

export { Event, Events }