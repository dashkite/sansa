import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"

image = ( key, specifier, { gadget }) ->

  HTML.tag "vellum-field",
    name: key
    label: specifier.title ? Format.title key
    hint: specifier.hint ? "The image to display"
    [

      HTML.div class: "image", [
        HTML.div class: "thumbnail", [
          HTML.img src: gadget[ key ]
        ]
      ]

      HTML.tag "sansa-select-image"
        attributes:
          name: "image.url"
          exportparts: "L1:L2, L2:L3, L3:L4"

    ]

export { image }