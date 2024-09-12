import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import DOM from "@dashkite/dominator"
import { Event } from "@dashkite/rio-europa"

initialize = Fn.pipe [

  Rio.change "input[type='url']", [
    K.poke Fn.pipe [
      DOM.target
      Obj.get "value"
      Obj.tag "url"
    ]

    K.peek ({ url }, handle ) -> 
      handle.dom.value = url
      handle.dispatch "change", url

    Event.make "home"

  ]
]

export default { initialize }