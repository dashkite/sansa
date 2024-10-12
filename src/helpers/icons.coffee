import HTML from "@dashkite/html-render"

Icons =
  # mixins
  # TODO remove theme
  theme: "palette-line"
  borders: "square-line"
  colors: "palette-line"
  fonts: "font-family"
  layout: "layout-3-fill"
  flow: "layout-3-fill"
  grid: "grid-fill"
  # size: "expand-width-fill"
  size: "font-size-2"
  proximity: "ruler-line"
  mixin: "bard-fill"

  # gadgets
  container: "folder-line"
  page: "pages-line"
  image: "image-line"
  variant: "moon-line"
  text: "sticky-note-line"
  navigation: "menu-line"
  link: "link"
  icon: "image-circle-line"

  template: "shapes-line"
  article: "newspaper-line"

  # application actions
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