import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import DOM from "@dashkite/dominator"
import { Event } from "@dashkite/rio-europa"
import Observable from "@dashkite/rio-observable"
import Registry from "./registry"

Registry[ "select-color-input" ] = Fn.pipe [

  Rio.event "select", [
    Rio.matches "vellum-tabs", [
      Rio.intercept
      Ks.poke Fn.pipe [
        Obj.get "detail"
        Obj.get "name"
        Obj.tag "source"
      ]
      Event.make "select color input"
    ]

  ]

]
