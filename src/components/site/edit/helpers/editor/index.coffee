import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"

import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
# import HTTP from "@dashkite/rio-vega"

import Registry from "@dashkite/rio-helium"
import Observable from "@dashkite/rio-observable"
import Halstead from "@dashkite/halstead"

import { Gadgets } from "@dashkite/talisa"

import Site from "#helpers/site"

import html from "./html"

import * as State from "./state"

# TODO add to katana 
#      https://github.com/dashkite/katana/issues/10
discard = ( fx ) ->
  f = Fn.flow fx
  ( daisho ) ->
    await f daisho.clone()
    daisho

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

  load: Fn.flow [
    Rio.description
    Site.load
    Registry.get "sansa.editor.state"
    # save the existing site, which might
    # be redundant if it's the same site
    # we just loaded, but it might not
    discard [
      Observable.get
      K.push ({ site, gadgets }) -> { site..., gadgets }
      Site.save
    ]
    Observable.update [
      Ks.poke ( state, site ) ->
        if state.site?.address == site.address
          state
        else
          { open: [], gadgets: ( Gadgets.from site.gadgets ), site }
    ] 
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
