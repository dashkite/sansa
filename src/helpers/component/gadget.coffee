import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import { Gadget as _Gadget, Gadgets } from "@dashkite/talisa"
import State from "#helpers/state"
import Basic from "#helpers/component/basic"

find = K.push ({ gadgets, selected }) ->
  if selected?
    Gadgets.find selected, gadgets

update = K.peek ( state, data ) ->
  { selected, gadgets } = state
  if selected?
    target = Gadgets.find selected, gadgets
    Object.assign target, data



Gadget =

  editor: ({ normalize, denormalize, html, css }) ->

    Fn.pipe [
  
      Rio.diff
  
      Rio.initialize [

        Basic.form css

        Rio.input "form", [
          Rio.form
          normalize
          State.update [ update ]
        ]

        Rio.change "form", [
          Rio.form
          normalize
          State.update [ update ]
        ]

      ]
  
      Rio.connect [
        State.observe [
          K.peek ( state ) -> console.log { state }
          find
          denormalize
          Rio.render html
        ]
      ]

      Rio.disconnect [
        K.peek ( handle ) -> console.log disconnect: handle
        State.cancel
      ]    
    ]

export default Gadget
