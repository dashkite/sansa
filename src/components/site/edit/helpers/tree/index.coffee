import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import Observable from "@dashkite/rio-observable"
import Registry from "@dashkite/rio-helium"
import DOM from "@dashkite/dominator"

import Data from "./data"
import Gadget from "./gadget"
import Node from "./node"
import Drag from "./drag"

Tree = 

  # run button actions
  actions: Fn.pipe [

    Rio.click "button", [
      K.poke Fn.pipe [
        DOM.target
        DOM.closest "button"
        Obj.get "name"
      ]
      Registry.get "sansa.editor.state"
      Observable.update [
        K.peek ( data, name ) -> 
          [ action, type ] = name.split /\s+/
          data.editor = { action, type }
          data
      ]
    ]

    # select a gadget to add
    Rio.event "select", [
      Rio.intercept
      Rio.matches "sansa-add-gadget", [
        Fn.flow [
          Registry.get "sansa.editor.state"
          Observable.update [ Gadget.add ]
        ]
      ]
    ]

  ]

  # toggle folders in tree
  toggle: Rio.toggle "details", [
    Registry.get "sansa.editor.state"
    Observable.update [ Node.toggle ]
  ]

  # select a node in the tree
  select: Rio.click ".node label", [
    Rio.target
    Rio.closest ".node"
    Data.key
    Registry.get "sansa.editor.state"
    Observable.update [ Node.select ]
  ]
     
  "inline editing": Fn.pipe [

    # double-click to start inline editing a node name
    Rio.doubleClick ".node label", [
      Rio.target
      Rio.closest ".node"
      Node.renaming
    ]

    # update the node name
    Rio.input ".node input", [
      Rio.target
      Registry.get "sansa.editor.state"
      Observable.update [ Node.rename ]
    ]

    # stop editing
    Rio.focusout ".node input", [
      Registry.get "sansa.editor.state"
      Observable.update [
        K.peek ( state ) -> delete state.renaming
      ]
    ]

    # exit input
    Rio.keyup ".node input", [
      K.peek ( event ) ->
        switch event.code
          when "Enter", "Escape"
            event.target.blur()
    ]

  ]

  "drag-and-drop": Fn.pipe [

    Rio.dragstart ".node label", [
      K.peek ( event ) -> console.log dragstart: event
      Rio.target
      Rio.closest ".node"
      Data.key
      Drag.start
    ]

    Rio.dragover ".zone", [
      Rio.debounce 100, [ 
        Registry.get "sansa.editor.state"
        Observable.load
        Drag.over 
      ]
    ]

    Rio.dragleave ".zone", [
      Drag.leave
    ]

    Rio.dragover "details:not([open])", [
      Rio.debounce 500, [
        Rio.target
        Rio.closest ".node"
        Data.key
        Registry.get "sansa.editor.state"
        Observable.update [ Node.open ]        
      ]
    ]

    Rio.drop ".zone", [
      Registry.get "sansa.editor.state"
      Observable.update [ Drag.drop ]
    ]    

  ]

Tree.initialize = Fn.pipe [
  Tree.actions
  Tree.toggle
  Tree.select
  Tree[ "inline editing" ]
  Tree[ "drag-and-drop" ]
]

export { Tree }