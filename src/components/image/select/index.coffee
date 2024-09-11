import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import * as Posh from "@dashkite/posh"
import DOM from "@dashkite/dominator"
import Observable from "@dashkite/rio-observable"
import { Event, Events } from "@dashkite/rio-europa"

import machine from "./machine"

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

      Events.start machine

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

      Rio.change "input[type='file']", [
        K.push ( event, handle ) ->
          file = event.target.files[0]
          url = URL.createObjectURL file
          handle.dom.value = url
          handle.dispatch "change", url
          { url }
        Event.make "file upload"
      ]

      Rio.input "[data-state='browse gadgets'] vellum-autocomplete[name='term']", [
        Ks.poke Fn.pipe [
          DOM.target
          Obj.get "value"
          Obj.tag "term"
        ]
        Event.make "browse gadgets"
      ]

      Rio.change "[data-state='browse gadgets'] vellum-autocomplete[name='term']", [
        Ks.poke Fn.pipe [
          DOM.target
          Obj.get "value"
          Obj.tag "url"
        ]
        K.peek ({ url }, handle ) -> 
          handle.dom.value = url
          handle.dispatch "change", url
        Event.make "home"
      ]

      Rio.input "[data-state='browse unsplash'] vellum-autocomplete[name='term']", [
        Ks.poke Fn.pipe [
          DOM.target
          Obj.get "value"
          Obj.tag "term"
        ]
        Event.make "browse unsplash"
      ]

      Rio.change "[data-state='browse unsplash'] vellum-autocomplete[name='term']", [
        Ks.poke Fn.pipe [
          DOM.target
          Obj.get "value"
          Obj.tag "url"
        ]
        K.peek ({ url }, handle ) -> 
          handle.dom.value = url
          handle.dispatch "change", url
        Event.make "home"
      ]      

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
  ]