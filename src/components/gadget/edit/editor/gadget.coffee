import * as K from "@dashkite/katana"

Gadget =

  get: K.push ({ gadgets, selected }) ->
    if selected? then gadgets.get selected

  update: K.pop ( data, gadget ) ->
    Object.assign gadget, data

export default Gadget