import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

icon = ( value, data ) ->
  Render.field
    name: "icon"
    label: "Icon"
    hint: "The icon to display"
    type: "custom"
    html: HTML.div [
      HTML.div class: "preview", [
        HTML.i class: "ri-#{ value }-#{ data['hints.style'] }"
      ]
      HTML.input name: "icon", type: "hidden", value: value
    ]

export { icon }