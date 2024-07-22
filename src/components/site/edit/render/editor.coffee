import * as Render from "@dashkite/rio-arriba/render"

editor = ({ selected, editor }) ->
  if editor?
    Render.component
      prefix: "sansa"
      action: editor.action
      target: editor.type
      bindings: { selected }

export default editor
export { editor }