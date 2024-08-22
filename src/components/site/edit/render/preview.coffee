import * as Render from "@dashkite/rio-arriba/render"

preview = ({ selected }) ->
  if selected?
    [ page ] = selected.split "/"
    Render.component
      prefix: "sansa"
      action: "preview"
      target: "site"
      bindings: key: page

export default preview
export { preview }