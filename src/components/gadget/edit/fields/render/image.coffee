import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

# TODO customize hint for different contexts
#      how do we want to handle this generally?

image = ( value, { gadget, state }) ->

    Render.field
      name: "image"
      label: "Image"
      hint: "The image to display."
      type: "custom"
      html: HTML.div class: "image", [
        HTML.div class: "thumbnail", [
          HTML.img src: value ? "https://placehold.co/200x150/orange/white"
        ]
        Render.component
          prefix: "sansa"
          action: "select"
          target: "image"
          attributes:
            name: "image.url"
            exportparts: "L1:L2, L2:L3, L3:L4"
            # exportparts: "header"
      ]

export { image }