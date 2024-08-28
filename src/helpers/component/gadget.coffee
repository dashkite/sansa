import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import State from "#helpers/state"
import Basic from "#helpers/component/basic"

Form =

  before: K.poke ( gadget, state ) ->
    {
      state.editor?.data...
      gadget.raw...
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

  editor: ( Editor ) ->

    Fn.pipe [
  
      Rio.diff
  
      Rio.initialize [

        Basic.form Editor.css

        # TODO do we also need to handle change events?
        Rio.input "form", [
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
          Editor.denormalize
          Rio.render Editor.html
        ]

      ]
  
      Rio.connect [
        State.observe [
          Gadget.find
          Form.before
          Editor.denormalize
          Rio.render Editor.html
        ]
      ]

      Rio.disconnect [
        State.cancel
      ]    
    ]

export default Gadget
