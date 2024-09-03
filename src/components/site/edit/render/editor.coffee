import * as Render from "@dashkite/rio-arriba/render"

editor = ({ selected, editor }) ->
  if editor?
    Render.component
      prefix: "sansa"
      action: editor.action
      target: "gadget"
      bindings: 
        type: editor.type
        key: selected
  else ""

export default editor
export { editor }