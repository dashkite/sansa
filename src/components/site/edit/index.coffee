import * as Fn from "@dashkite/joy/function"
import * as Arr from "@dashkite/joy/array"
import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import HTTP from "@dashkite/rio-vega"

import State from "#helpers/state"

import configuration from "#configuration"
{ origin } = configuration

import Helpers from "./helpers"
import html from "./html"
import css from "./css"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-edit-site"
    Rio.diff

    Rio.connect [
      State.observe [
        Rio.render html
        Helpers.focus
      ]
    ]

    Rio.disconnect [
      State.cancel
    ]

    Rio.initialize [

      Rio.shadow
      
      Rio.sheets [ 
        css
        Posh.component
        Posh.forms
        Posh.icons
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

      # edit title
      Rio.click "header h1", [
        State.update [ Helpers.edit "title" ]
      ]

      # edit description
      Rio.click "header p", [
        State.update [ Helpers.edit "description" ]
      ]

      Rio.change "header", [
        State.update [
          K.peek ( state, event ) ->
            delete state.editing
            # Object.assign state.site, data
            { name, value } = event.target
            state.site[ name ] = value
        ]
      ]

      # run button actions
      Rio.click "button", [
        Rio.target
        Rio.closest "button"
        Rio.name
        State.update [ Helpers.run ]
      ]

      # toggle folders in tree
      Rio.toggle "details", [
        State.update [ Helpers.toggle ]
      ]


      # select a node in the tree
      Rio.click ".node label", [
        Rio.target
        Rio.closest ".node"
        Helpers.select
      ]

      # double-click to start inline editing a node name
      Rio.doubleClick ".node label", [
        Rio.target
        Rio.closest ".node"
        Helpers.renaming
      ]

      # update the node name
      Rio.input ".node label", [
        Rio.target
        State.update [ Helpers.rename ]
      ]

      # finishing editing a node name
      Rio.change ".node label", [
        Helpers.finish
        State.assign
      ]

      # select a gadget to add
      Rio.event "select", [
        Rio.intercept
        Rio.matches "sansa-add-gadget", [
          State.update [ Helpers.add ]
        ]
      ]

      # update a gadget from the editor
      Rio.event "input", [
        Rio.intercept
        Rio.within "[slot='editor']", [
          State.update [ Helpers.update ]
        ]
      ]

      Rio.dragstart ".node label", [
        Rio.target
        Rio.closest ".node"
        Helpers.key
        Helpers.Drag.start
      ]

      Rio.dragover ".zone", [
        Rio.debounce 100, [ Helpers.Drag.over ]
      ]

      Rio.dragleave ".zone", [
        Helpers.Drag.leave
      ]

      Rio.dragover "details:not([open])", [
        Rio.debounce 500, [
          Rio.target
          Rio.closest ".node"
          Helpers.key
          State.update [ Helpers.open ]        
        ]
      ]

      Rio.drop ".zone", [
        State.update [ Helpers.Drag.drop ]
      ]

    ]
  ]