import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import DOM from "@dashkite/dominator"
import { Event } from "@dashkite/rio-europa"

selector = "vellum-autocomplete[name='term']"

initialize = Fn.pipe [

  Rio.input selector, [
    Ks.poke Fn.pipe [
      DOM.target
      Obj.get "value"
      Obj.tag "term"
    ]
    Event.make "browse icons"
  ]

  Rio.change selector, [
    Ks.poke Fn.pipe [
      DOM.target
      Obj.get "value"
    ]
    K.peek ( term, handle ) -> 
      handle.dom.value = term
      handle.dispatch "change", term
    Event.make "browse icons"
  ]

]

export default { initialize }