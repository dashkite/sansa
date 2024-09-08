import * as Render from "@dashkite/rio-arriba/render"

editor = ({ selected, editor }) ->
  if editor?
    # TODO phase out special cases once gadget editor is generalized
    #      (or not)
    switch editor.type
      when "image", "variant"
        Render.component
          prefix: "sansa"
          action: editor.action
          target: editor.type
          bindings: 
            key: selected
      else
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