import * as Fn from "@dashkite/joy/function"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import HTTP from "@dashkite/rio-vega"
import Katana from "#helpers/katana"

import Registry from "@dashkite/helium"
import Observable from "@dashkite/observable"
import { Gadgets } from "@dashkite/talisa"

import State from "./state"
import html from "../html"

tag = ( key ) ->
  K.poke ( value ) -> [ key ]: value

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

update = K.peek ( data, { detail }) ->
  { selected, gadgets } = data
  target = gadgets.get selected
  Object.assign target, detail



# TODO find another way to do this
unwrap = ( state ) ->
  { state..., gadgets: state?.gadgets?.data }

Storage =

  get: ( name ) ->
    if ( item = localStorage.getItem name )?
      JSON.parse item
    else {}

  set: ( name, value ) ->
    if value?
      localStorage.setItem name, JSON.stringify value
    else
      localStorage.removeItem name

do ->
  state = Storage.get "sansa.editor.state"
  observable = Observable.from state
  observable.observe ( state ) -> 
    Storage.set "sansa.editor.state", unwrap state
    Registry.set "sansa.editor.state", observable

Editor =

  connect: Fn.pipe [
    Rio.connect [
      State.observe [
        Rio.render html
        focus
      ]
    ]

    Rio.disconnect [
      State.cancel
    ]
  ]

  load: HTTP.get [
    HTTP.json [
      Katana.tag "site"
      State.initialize
    ]
    HTTP.failure [ warn ]
  ]


  # update a gadget from the editor
  input: Rio.input "[slot='editor']", [
    State.update [ update ]
  ]

Editor.initialize = Editor.input
      
export { Editor }
