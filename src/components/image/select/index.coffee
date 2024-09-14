import * as Obj from "@dashkite/joy/object"
import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as Ks from "@dashkite/katana/sync"
import * as Posh from "@dashkite/posh"
import Observable from "@dashkite/rio-observable"
import { Events as Europa } from "@dashkite/rio-europa"
import machine from "./machine"

import Events from "./events"

import html from "./html"
import css from "./css"


class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-select-image"
    Rio.diff

    Rio.field

    Rio.connect [
      Ks.push Obj.get "state"
      Observable.observe [
        Rio.render html
        Rio.focus "input, vellum-autocomplete"
      ]
    ]

    Rio.disconnect [
      Ks.push Obj.get "state"
      Observable.cancel 
    ]

    Rio.initialize [

      Rio.shadow
      Rio.sheets [ 
        Posh.component
        Posh.icons
        Posh.forms
        Posh.compact, 
        css 
      ]

      Europa.start machine,
        name: "home"
        context: {}

      Events[ "home" ].initialize
      Events[ "browse files" ].initialize
      Events[ "browse gadgets" ].initialize
      Events[ "browse unsplash" ].initialize
      Events[ "provide url" ].initialize 

    ]
  ]