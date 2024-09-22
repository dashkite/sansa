import HTML from "@dashkite/html-render"

preview = ({ selected }) ->
  if selected?
    [ page ] = selected.split "/"
    HTML.tag "sansa-preview-site", data: key: page

export default preview
export { preview }