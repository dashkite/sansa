import * as K from "@dashkite/katana/async"
import * as Format from "@dashkite/rio-arriba/format"
import { Gadget, Gadgets } from "@dashkite/talisa"

# slightly different variation than the one for layout editor
find = K.mpoke ({ gadgets }, key ) ->
  Gadgets.find key, gadgets


add = K.peek ( data, event ) ->

  { type } = event.detail
  { selected, gadgets } = data
  
  # 1. construct the new gadget
  key = selected + "/untitled-#{ type }"
  name = Format.title "untitled #{ type }"
  gadgets.push Gadget.make { key, name, type }

  # 2. add the gadget to the currently selected gadget
  parent = Gadgets.find selected, gadgets
  parent.content.push key

  # 3. ensure the selected gadget is opened
  # using a Set avoids adding duplicate keys
  open = new Set data.open
  open.add selected
  data.open = Array.from open

  # 4. change the selected gadget to be the newly created gadget
  data.selected = key

  # 5. update the editor
  data.editor = { action: "edit", type }


export default { find, add }