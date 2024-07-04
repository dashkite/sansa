import HTML from "@dashkite/html-render"

Icons =
  page: "file-text-line"
  layout: "layout-3-fill"
  image: "image-line"
  text: "sticky-note-line"
  article: "newspaper-line"
  navigation: "menu-line"
  link: "link"
  icon: "shapes-line"
  open: "arrow-down-s-fill"
  closed: "arrow-right-s-fill"
  add: "add-line"
  delete: "delete-bin-7-line"

icon = ( name ) ->
  HTML.i class: "ri-#{ Icons[ name ] }"

export default icon
export { icon, Icons }