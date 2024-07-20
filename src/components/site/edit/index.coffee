import * as Arr from "@dashkite/joy/array"
import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import HTTP from "@dashkite/rio-vega"

import configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import css from "./css"
import Helpers from "./helpers"
import State from "./state"

import mock from "./mock"

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

      Rio.observe "data", [
        State.save
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
            Rio.assign "data"
          ]
          HTTP.failure [ Helpers.warn ]
        ]
      ]

      Rio.toggle "details", [
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
        Rio.assign "data"
      ]

      Rio.doubleClick ".node label", [
        Rio.intercept
        Rio.target
        Rio.closest ".node"
        Helpers.key
        Helpers.tag "renaming"
        Rio.assign "data"
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