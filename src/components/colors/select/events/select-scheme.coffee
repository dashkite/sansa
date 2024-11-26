import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Text from "@dashkite/joy/text"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import DOM from "@dashkite/dominator"
import { Event } from "@dashkite/rio-europa"
import Observable from "@dashkite/rio-observable"
import Registry from "./registry"

Registry[ "select-scheme" ] = Fn.pipe [

  Rio.input "[name='scheme']", [
    K.poke Fn.pipe [
      Obj.get "target"
      Obj.get "value"
      Text.parseNumber
      Obj.tag "scheme"
    ]
    Event.make "select scheme"
  ]

]