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

# temporary for drag-and-drop experiments
import { Gadget, Gadgets } from "@dashkite/talisa"

# placing this here for now

apply = ( f, args ) -> f.apply null, args

hit = ( tolerance ) ->
  ({ target, point, root }) ->
    target == ( root.elementFromPoint ( point.x + tolerance.x ), 
                      ( point.y + tolerance.y ))

isWithin = hit x: 0, y: -4 # pixels

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

      # toggle folders in tree
      Rio.toggle "details", [
        State.update [ Helpers.toggle ]
      ]

      # run button actions
      Rio.click "button", [
        Rio.target
        Rio.closest "button"
        Rio.name
        State.update [ Helpers.run ]
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
          State.update [ Helpers.edit ]
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
        K.peek ( key, event, handle ) ->
          handle.drag = source: key
          event.dataTransfer.effectAllowed = "move"
      ]

      Rio.dragover ".zone", [
        Rio.debounce 100, [
          K.peek ( event, handle ) ->
            { source } = handle.drag
            target = event.target.closest ".node"
            if !( target.dataset.key.startsWith source )
              event.target.classList.add "targeted"
            else
              event.dataTransfer.dropEffect = "none"
        ]
      ]

      Rio.dragleave ".zone", [
        K.peek ( event, handle ) ->
          event.target.classList.remove "targeted"
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
        State.update [
          K.peek ( state, event, handle ) ->
            { action, target } = { event.target.dataset... }
            event.target.classList.remove "targeted"
            { source } = handle.drag
            delete handle.drag
            apply Gadgets[ action ], [{ source, target }, state.gadgets ]
        ]
      ]

    ]
  ]