import HTML from "@dashkite/html-render"

Icons =
  page: "file-text-line"
  layout: "layout-3-fill"
  image: "image-line"
  variant: "image-fill"
  text: "sticky-note-line"
  article: "newspaper-line"
  navigation: "menu-line"
  link: "link"
  icon: "image-circle-line"
  template: "shapes-line"
  open: "arrow-down-s-fill"
  closed: "arrow-right-s-fill"
  "add gadget": "add-line"
  "add page": "file-add-line"
  "remove gadget": "delete-bin-7-line"
  edit: "edit-line"
  search: "search-line"
  forward: "arrow-right-s-line"
  back: "arrow-left-s-line"

icon = ( name ) ->
  HTML.i class: "ri-#{ Icons[ name ] }"

export default icon
export { icon, Icons }