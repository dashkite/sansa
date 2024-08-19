import * as Fn from "@dashkite/joy/function"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import HTTP from "@dashkite/rio-vega"
import { Gadget, Gadgets } from "@dashkite/talisa"

import State from "#helpers/state"
import Katana from "#helpers/katana"

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
  target = Gadgets.find selected, gadgets
  Object.assign target, detail


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
