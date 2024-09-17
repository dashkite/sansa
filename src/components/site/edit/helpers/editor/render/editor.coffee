import * as Render from "@dashkite/rio-arriba/render"

editor = ({ selected, editor }) ->
  if editor?
    Render.component
      prefix: "sansa"
      action: editor.action
      target: "gadget"
      attributes:
        exportparts: "L1:L2, L2:L3, L3:L4"
      bindings: 
        type: editor.type
        key: selected

export default editor
export { editor }