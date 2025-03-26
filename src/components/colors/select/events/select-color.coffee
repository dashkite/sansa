import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import * as DOM from "@dashkite/dominator"
import { Event } from "@dashkite/rio-europa"
import Registry from "./registry"

Registry[ "select-color" ] = Fn.pipe [

  Rio.event "input", [
    Rio.matches "vellum-field[name='color']", [
      Rio.intercept
      Ks.poke Fn.pipe [
        Obj.get "target"
        Obj.get "value"
        Obj.tag "color"
      ]
      Event.make "select color"
    ]
  ]

]
