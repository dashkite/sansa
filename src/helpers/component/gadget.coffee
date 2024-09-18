import * as Fn from "@dashkite/joy/function"
import * as Type from "@dashkite/joy/type"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import Observable from "@dashkite/rio-observable"
import Registry from "@dashkite/rio-helium"

import Basic from "#helpers/component/basic"

Form =

  before: K.poke ( description, gadget, state ) ->
    {
      gadget
      state
      description
    }
  
  after: K.peek ( data, state ) ->
    if state.editor?
      state.editor.data = data

Gadget =

  find: K.push ({ gadgets, selected, editor }) ->
    if selected? then gadgets.get selected

  update: K.pop ( data, state ) ->
    { selected, gadgets } = state
    if selected?
      target = gadgets.get selected
      Object.assign target, data

  input: ( fx ) ->
    Rio.input "form", [
      Registry.get "sansa.editor.state"
      Observable.update [
        Rio.form
        Form.after
        Fn.flow fx
        Gadget.update
      ]
    ]

  change: ( fx ) ->
    Rio.change "form", [
      Registry.get "sansa.editor.state"
      Observable.update [
        Rio.form
        K.peek ( form ) -> console.log { form }
        Form.after
        Fn.flow fx
        Gadget.update   
      ]
    ]

  activate: ( fx ) ->
    Rio.activate [
      Registry.get "sansa.editor.state"
      Observable.get
      Gadget.find
      K.test Type.isDefined, Fn.flow [
        Rio.description
        Form.before
        Fn.flow fx
      ]
    ]

  connect: ( fx ) ->

    Fn.pipe [

      Rio.connect [
        Registry.get "sansa.editor.state"
        Observable.observe [
          Gadget.find
          K.test Type.isDefined, Fn.flow [
            Rio.description
            Form.before
            Fn.flow fx
          ]
        ]
      ]

      Rio.disconnect [
        Observable.cancel
      ]    

    ]

  editor: ( Editor ) ->

    Fn.pipe [
  
      Rio.diff
  
      Rio.initialize [

        Basic.form Editor.css

        Rio.input "form", [
          Registry.get "sansa.editor.state"
          Observable.update [
            Rio.form
            Form.after
            Editor.normalize
            Gadget.update   
          ]
        ]

        Rio.change "form", [
          Registry.get "sansa.editor.state"
          Observable.update [
            Rio.form
            Form.after
            Editor.normalize
            Gadget.update   
          ]
        ]

        Rio.activate [
          Registry.get "sansa.editor.state"
          Observable.get
          Gadget.find
          K.test Type.isDefined, Fn.flow [
            Rio.description
            Form.before
            Editor.denormalize
            Rio.render Editor.html
          ]
        ]

      ]
  
      Rio.connect [
        Fn.flow [
          Registry.get "sansa.editor.state"
          Observable.observe [
            Gadget.find
            K.test Type.isDefined, Fn.flow [
              Rio.description
              Form.before
              Editor.denormalize
              Rio.render Editor.html
            ]
          ]
        ]
      ]

      Rio.disconnect [
        Observable.cancel
      ]    
    ]

export default Gadget
