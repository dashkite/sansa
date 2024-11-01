import * as K from "@dashkite/katana/async"
import Format from "@dashkite/format-text"

# slightly different variation than the one for layout editor
find = K.mpoke ({ gadgets }, key ) -> gadgets.get key

add = K.peek ( data, event ) ->

  { type } = event.detail
  { selected, gadgets } = data
  
  # 1. construct the new gadget
  source = gadgets.make { type }

  # 2. add the gadget to the currently selected gadget
  if selected?
    destination = gadgets.get selected
    source.addTo destination

    # 3. ensure the selected gadget is opened
    # using a Set avoids adding duplicate keys
    # TODO the “open set” should probably be encapsulated somewhere
    open = new Set data.open
    open.add selected
    data.open = Array.from open

  # 4. change the selected gadget to be the newly created gadget
  data.selected = source.key

  # 5. update the editor
  # TODO type is redundant since we can infer it from the selected gadget
  data.editor = { action: "edit", type }


export default { find, add }