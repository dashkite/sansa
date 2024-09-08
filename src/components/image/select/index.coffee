import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import * as Posh from "@dashkite/posh"
import DOM from "@dashkite/dominator"
import Observable from "@dashkite/rio-observable"

import { Event, Events } from "./events"

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

    Rio.disconnect [ Observable.cancel ]

    Rio.initialize [

      Rio.shadow
      Rio.sheets [ 
        Posh.component
        Posh.icons
        Posh.forms
        Posh.compact, 
        css 
      ]

      Events.start

      Rio.click "button[name='browse-files]", [
        Rio.target
        K.peek Fn.pipe [
          DOM.closest "button"
          DOM.nextSibling
          DOM.click
        ]
      ]

      Rio.click "button:not([name='browse-files])", [
        K.poke Fn.pipe [
          DOM.target
          DOM.closest "button"
          DOM.attributes
          Obj.get "name"
        ]
        Event.from
      ]

      # Rio.change "input[type='file']", [
      #   # put file selected event on the stack
      #   Event.from
      # ]

      # Rio.input "vellum-autocomplete[name='term']", [
      #   # put search term on the stack
      #   # how do we know which flow we're in here?
      #   # generate event
      # ]

      # Rio.change "vellum-autocomplete[name='term']", [
      #   # put selected item on the stack
      #   # how do we know which flow we're in here?
      #   # generate event
      # ]
      
      # Rio.change "input[type='url']", [
      #   Rio.target
      #   Rio.get "value"
      #   K.poke ( url ) ->
      #     name: "url provided"
      #     image: { url }
      #   Event.from
      # ]
    ]
  ]
