import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import DOM from "@dashkite/dominator"
import { Event } from "@dashkite/rio-europa"

initialize = Fn.pipe [

  Rio.click "button[name='browse files']", [
    K.peek Fn.pipe [
      DOM.target
      DOM.closest "button"
      DOM.nextSibling
      DOM.click
    ]
  ]

  Rio.click "button:not([name='browse files'])", [
    K.push Fn.pipe [
      DOM.target
      DOM.closest "button"
      DOM.attributes
      Obj.get "name"
    ]
    K.push ( name, event, handle ) -> 
      { name, context: { event, handle }}
    Event.from
  ]

]

export default { initialize }