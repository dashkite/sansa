import * as Fn from "@dashkite/joy/function"
import * as Type from "@dashkite/joy/type"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import State from "#helpers/state"
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
      State.update [
        Rio.form
        Form.after
        Fn.flow fx
        Gadget.update
      ]
    ]

  change: ( fx ) ->
    Rio.change "form", [
      State.update [
        Rio.form
        Form.after
        Fn.flow fx
        Gadget.update   
      ]
    ]

  activate: ( fx ) ->
    Rio.activate [
      State.load
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
        State.observe [
          Gadget.find
          K.test Type.isDefined, Fn.flow [
            Rio.description
            Form.before
            Fn.flow fx
          ]
        ]
      ]

      Rio.disconnect [
        State.cancel
      ]    

    ]



  editor: ( Editor ) ->

    Fn.pipe [
  
      Rio.diff
  
      Rio.initialize [

        Basic.form Editor.css

        Rio.input "form", [
          State.update [
            Rio.form
            Form.after
            Editor.normalize
            Gadget.update   
          ]
        ]

        Rio.change "form", [
          State.update [
            Rio.form
            Form.after
            Editor.normalize
            Gadget.update   
          ]
        ]

        Rio.activate [
          State.load
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
        State.observe [
          Gadget.find
          K.test Type.isDefined, Fn.flow [
            Rio.description
            Form.before
            Editor.denormalize
            Rio.render Editor.html
          ]
        ]
      ]

      Rio.disconnect [
        State.cancel
      ]    
    ]

export default Gadget
