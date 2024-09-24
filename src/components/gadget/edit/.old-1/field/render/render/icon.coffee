import HTML from "@dashkite/html-render"

icon = ( value, { gadget, state }) ->

  style = gadget["hints.style"]

  Render.field
    name: "icon"
    label: "Icon"
    hint: "The icon to display"
    type: "custom"
    html: HTML.div class: "icon", [

      HTML.div class: "preview", [
        HTML.i class: "ri-#{ value }-#{ style }"
      ]

      HTML.tag "sansa-select-icon"
        attributes:
          name: "icon"
          data: { style }
          exportparts: "L1:L2, L2:L3, L3:L4"
      ]

export { icon }
