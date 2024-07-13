import * as Render from "@dashkite/rio-arriba/render"

Editor =

  add: ({ type }) ->
    Render.component
      prefix: "sansa"
      action: "add"
      target: type
      bindings: {}

  "add gadget": ({ gadgets, selection }) ->
    Editor.add type: "gadget"

  "add layout": ({ gadgets, selection }) ->
    Editor.add type: "layout"

editor = ({ gadgets, selection, action }) ->
  if action?
    if ( handler = Editor[ action ])?
      handler.apply null, [{ gadgets, selection }]
    else
      console.warn "missing action:", action

export default editor
export { editor, Editor }