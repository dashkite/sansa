import * as K from "@dashkite/katana"

Gadget =

  get: K.push ({ gadgets, selected }) ->
    if selected? then gadgets.get selected

  update: K.pop ( data, state ) ->
    { selected, gadgets } = state
    if selected?
      target = gadgets.get selected
      Object.assign target, data

export default Gadget