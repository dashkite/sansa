import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import { Gadget as _Gadget, Gadgets } from "@dashkite/talisa"
import State from "#helpers/state"
import Basic from "#helpers/component/basic"

find = K.poke ({ gadgets, selected }) ->
  Gadgets.find selected, gadgets

update = K.peek ( state, data ) ->
  { selected, gadgets } = state
  target = Gadgets.find selected, gadgets
  Object.assign target, data

Gadget =

  editor: ({ normalize, denormalize, html, css }) ->

    Fn.pipe [
  
      Rio.diff
  
      Rio.initialize [

        Basic.form css

        Rio.input "form", [
          Rio.intercept
          Rio.form
          normalize
          State.update [ update ]
        ]
      ]
  
      Rio.connect [
        State.observe [
          find
          denormalize
          Rio.render html
        ]
      ]

      Rio.disconnect [
        State.cancel
      ]    
    ]

export default Gadget
