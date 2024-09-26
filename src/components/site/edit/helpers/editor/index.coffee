import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"

import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import HTTP from "@dashkite/rio-vega"

import Registry from "@dashkite/rio-helium"
import Observable from "@dashkite/rio-observable"
import Halstead from "@dashkite/halstead"

import html from "./html"

import * as State from "./state"

Halstead.persist "sansa.editor.state", State

warn = K.peek ( error ) -> console.warn { error }

focus = Fn.flow [
  K.read "handle"
  K.peek ( handle ) ->
    handle
      .root
      .querySelectorAll "input"
      .values()
      .find ( input ) -> input.checkVisibility()
      ?.focus()
]

Editor =

  connect: Fn.pipe [
    Rio.connect [
      Fn.flow [
        Registry.get "sansa.editor.state"
        Observable.observe [
          Rio.render html
          focus
        ]
      ]
    ]

    Rio.disconnect [
      Observable.cancel
    ]
  ]

  load: HTTP.get [
    HTTP.json [
      Registry.get "sansa.editor.state"
      Fn.pipe [
        Observable.update [
          Ks.poke ( state, site ) -> 
            # TODO temporary hack until we update the API
            Object.assign site,
              title: site.name
              preferences: editor: sizes: [ 25, 50, 25 ]
            { state..., site }
        ]
      ]
    ]
    HTTP.failure [ warn ]
  ]


  # update a gadget from the editor
  input: Rio.input "[slot='editor']", [
    Registry.get "sansa.editor.state"
    Observable.update [
      K.peek ( data, { detail }) ->
        { selected, gadgets } = data
        target = gadgets.get selected
        Object.assign target, detail      
    ]
  ]

Editor.initialize = Editor.input
      
export { Editor }