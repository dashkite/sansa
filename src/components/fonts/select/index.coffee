import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Meta from "@dashkite/joy/metaclass"
import * as Text from "@dashkite/joy/text"

import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"

import * as Rio from "@dashkite/rio"
import DOM from "@dashkite/dominator"

import Observable from "@dashkite/rio-observable"
import { Events as Europa } from "@dashkite/rio-europa"

import * as Posh from "@dashkite/posh"

import machine from "./machine"

import Events from "./events"

import html from "./html"
import css from "./css"


class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-select-fonts"
    Rio.diff

    Rio.field

    Rio.connect [
      Observable.observe [
        Rio.dom
        K.poke Fn.pipe [
          DOM.attributes
          Obj.get "value"
          Text.parseNumber
          Obj.tag "index"
        ]
        K.poke ( attributes, state ) -> 
          Obj.merge state, attributes
        Rio.render html
        Rio.focus "input"
      ]
    ]

    Rio.disconnect [
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
        name: "initialize"
        context:
          index: 0
          fonts: {}
          pinned:
            base: false
            heading: false
            copy: false
          filters: {}

      Events[ "browse" ].initialize

    ]
  ]