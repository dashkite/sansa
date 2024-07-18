import * as Render from "@dashkite/rio-arriba/render"

Editor =

  edit: ({ type }) ->
    Render.component
      prefix: "sansa"
      action: "edit"
      target: type
      bindings: {}

  "add gadget": ({ gadgets, selection }) ->
    Render.component
      prefix: "sansa"
      action: "add"
      target: "gadget"
      bindings: {}

  "edit layout": ({ gadgets, selection }) ->
    Editor.edit type: "layout"

editor = ({ gadgets, selection, action }) ->
  if action?
    if ( handler = Editor[ action ])?
      handler.apply null, [{ gadgets, selection }]
    else
      console.warn "missing action:", action

export default editor
export { editor, Editor }