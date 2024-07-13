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
            # temporary mock
            K.poke ({ site }) -> 
              site.preferences ?= {}
              site.preferences.sizes ?= [ 25, 50, 25 ]
              site.branches ?= {}
              site.branches.main ?= mock
              { site }
            Rio.assign "data"
          ]
          HTTP.failure [ Helpers.warn ]
        ]
      ]

      Rio.click "button", [
        Rio.intercept
        Rio.target
        Rio.closest "button"
        Rio.name
        Helpers.run
      ]

      Rio.click ".node span", [
        Rio.intercept
        Rio.target
        Rio.parent
        Helpers.key
        Helpers.tag "selected"
        Helpers.unset "renaming"
        Rio.assign "data"
      ]

      Rio.doubleClick ".node span", [
        Rio.intercept
        Rio.target
        Rio.parent
        Helpers.key
        Helpers.tag "renaming"
        Rio.assign "data"
      ]

      Rio.event "select", [
        Rio.intercept
        Rio.matches "sansa-add-gadget", [
          K.peek ( event, handle ) ->
            handle.data.action = "add #{ event.detail?.type }"
        ]
      ]

    ]
  ]