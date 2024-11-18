import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import DOM from "@dashkite/dominator"
import { Event } from "@dashkite/rio-europa"


initialize = Fn.pipe [

  Rio.input "input", [
    K.poke Fn.pipe [
      Obj.get "target"
      Obj.get "value"
    ]
    K.peek ( value, handle ) ->
      handle.dom.value = value
      handle.dispatch "input", value
    Event.make "browse"
  ]

]

export default { initialize }