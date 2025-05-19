import HTML from "@dashkite/domo"

preview = ({ selected, mode }) ->
  if selected?
    [ key ] = selected.split "/"
    HTML.tag "sansa-preview-site", data: { key, mode }

export default preview
export { preview }