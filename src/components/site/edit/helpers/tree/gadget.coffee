import * as K from "@dashkite/katana/async"
import * as Format from "@dashkite/rio-arriba/format"

# slightly different variation than the one for layout editor
find = K.mpoke ({ gadgets }, key ) -> gadgets.get key

add = K.peek ( data, event ) ->

  { type } = event.detail
  { selected, gadgets } = data
  
  # 1. construct the new gadget
  name = Format.title "untitled #{ type }"
  gadget = gadgets.make { name, type }

  # 2. add the gadget to the currently selected gadget
  if selected?
    gadgets.add { source: gadget.key, parent: selected }

    # 3. ensure the selected gadget is opened
    # using a Set avoids adding duplicate keys
    open = new Set data.open
    open.add selected
    data.open = Array.from open

  # 4. change the selected gadget to be the newly created gadget
  data.selected = gadget.key

  # 5. update the editor
  data.editor = { action: "edit", type }


export default { find, add }