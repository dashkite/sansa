import * as Render from "@dashkite/rio-arriba/render"

editor = ({ editor }) ->
  if editor?
    Render.component
      prefix: "sansa"
      action: editor.action
      target: editor.type
      bindings: {}

export default editor
export { editor }