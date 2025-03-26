import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import * as DOM from "@dashkite/dominator"
import { Event } from "@dashkite/rio-europa"
import Registry from "./registry"

Registry[ "select-image" ] = Fn.pipe [
  Rio.change "sansa-select-image", [
    K.poke Fn.pipe [
      Obj.getx "target.value"
      Obj.tag "image"
    ]
    Event.make "select image"
  ]
]
