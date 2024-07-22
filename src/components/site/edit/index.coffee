import * as Arr from "@dashkite/joy/array"
import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import HTTP from "@dashkite/rio-vega"

import configuration from "#configuration"
{ origin } = configuration

import State from "#helpers/state"

import Helpers from "./helpers"
import html from "./html"
import css from "./css"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-edit-site"
    Rio.diff

    Rio.initialize [


      Rio.shadow
      
      Rio.sheets [ 
        css
        Posh.component
        Posh.forms
        Posh.icons
      ]
      
      State.observe [
        Rio.render html
        Helpers.focus
      ]

      Rio.describe [
        HTTP.resource {
          origin
          name: "site"
        }
      ]

      Rio.activate [
        HTTP.get [
          HTTP.json [
            Helpers.tag "site"
            State.initialize
          ]
          HTTP.failure [ Helpers.warn ]
        ]
      ]

      Rio.toggle "details", [
        State.load
        Helpers.toggle
      ]

      Rio.click "button", [
        Rio.intercept
        Rio.target
        Rio.closest "button"
        Rio.name
        Helpers.run
      ]

      Rio.click ".node label", [
        Rio.intercept
        Rio.target
        Rio.closest ".node"
        Helpers.key
        Helpers.tag "selected"
        Helpers.unset "renaming"
        State.assign
      ]

      Rio.doubleClick ".node label", [
        Rio.intercept
        Rio.target
        Rio.closest ".node"
        Helpers.key
        Helpers.tag "renaming"
        State.assign
      ]

      Rio.input ".node label", [
        Rio.intercept
        Rio.target
        Helpers.updateName
      ]

      Rio.change ".node label", [
        K.peek ( event, handle ) ->
          handle.data.renaming = undefined
      ]

      Rio.event "select", [
        Rio.intercept
        Rio.matches "sansa-add-gadget", [
          Helpers.add
        ]
      ]

      Rio.event "input", [
        Rio.intercept
        Rio.within "[slot='editor']", [
          Helpers.update
        ]
      ]

    ]
  ]