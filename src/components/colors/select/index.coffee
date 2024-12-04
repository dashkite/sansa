import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Meta from "@dashkite/joy/metaclass"
import * as Text from "@dashkite/joy/text"

import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"

import * as Rio from "@dashkite/rio"
import DOM from "@dashkite/dominator"
import DataURL from "@dashkite/dominator/data-url"

import Observable from "@dashkite/rio-observable"
import { Events as Europa } from "@dashkite/rio-europa"

import * as Posh from "@dashkite/posh"

import machine from "./machine"

import Events from "./events"

import html from "./html"
import css from "./css"


class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-select-colors"
    Rio.diff

    Rio.field

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
        context:
          color: "#000000"
          intensity: .1
          gradient: 0
          background: 0

      Events.initialize

    ]

    Rio.connect [
      Ks.push Fn.pipe [
        Obj.get "dom"
        DOM.attribute "value"
        DataURL.decode
      ]
      Observable.assign
    ]

    Rio.connect [

      Ks.peek Fn.pipe [
        Obj.get "dom"
        DOM.modify [ "value" ]
        DOM.dispatch "change"
      ]

      Observable.observe [
        Fn.tee Fn.flow [
          K.poke Fn.pipe [
            # TODO move into helper
            Obj.mask [ "color", "intensity", "gradient", "background" ]
            DataURL.encode
            Obj.tag "value"
          ]
          K.peek ({ value }, handle ) -> handle.dom.value = value
          Rio.reflect
        ]
        Rio.render html
        Rio.focus "input"
      ]
    ]

    Rio.disconnect [
      Observable.cancel 
    ]

  ]