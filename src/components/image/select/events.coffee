import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import Observable from "@dashkite/observable"
import Machine from "./machine"

Event =

  make: ( specifier ) -> 
    K.read "handle"
    K.pop ( handle ) -> 
      handle.events.enqueue specifier

  from: K.peek ( name, event, handle ) -> 
    events.queue { name, context: { event, handle }}

Events =

  start: Ks.peek ( handle ) ->
    handle.state = Observable.from {}
    do -> handle.events = await Machine.start handle.state
    return

export { Event, Events }