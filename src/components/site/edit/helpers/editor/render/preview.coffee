import HTML from "@dashkite/html-render"

preview = ({ selected, mode }) ->
  if selected?
    [ key ] = selected.split "/"
    HTML.tag "sansa-preview-site", data: { key, mode }

export default preview
export { preview }