import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import DOM from "@dashkite/dominator"
import { Event } from "@dashkite/rio-europa"
import Observable from "@dashkite/rio-observable"
import FontSets from "../font-sets"


initialize = Fn.pipe [

  Rio.click "button", [
    K.poke Fn.pipe [
      Obj.get "target"
      DOM.closest "button"
      ( button ) ->
        name: button.name
        action: button.dataset.action
    ]
    Event.make "pin"
  ]

  Rio.input "input", [
    K.poke Fn.pipe [
      Obj.get "target"
      Obj.get "value"
    ]
    K.read "handle"
    K.poke Obj.get "state"
    Observable.get
    K.poke ( state, index, handle ) ->
      value = FontSets.absoluteIndex index, state
      handle.dom.value = value
      handle.dispatch "input", value
      value
    Event.make "browse"
  ]

]

export default { initialize }