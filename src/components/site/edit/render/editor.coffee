import * as Render from "@dashkite/rio-arriba/render"

Editor =

  "add gadget": ({ gadgets, selection }) ->
    Render.component
      prefix: "sansa"
      action: "add"
      target: "gadget"
      bindings: {}

editor = ({ gadgets, selection, action }) ->
  if action?
    Editor[ action ].apply null, [{ gadgets, selection }]

export default editor
export { editor, Editor }