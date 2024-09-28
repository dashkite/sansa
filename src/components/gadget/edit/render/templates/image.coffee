import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"

image = ({ name, title, hint }, value ) ->

  HTML.tag "vellum-field",
    name: name
    [
      HTML.span slot: "label", title ? Format.title name
      HTML.span slot: "hint", hint ? "The image to display"
      HTML.div slot: "input", [
        HTML.div class: "image", [
          HTML.div class: "thumbnail", [
            HTML.img src: value
          ]
        ]

        HTML.tag "sansa-select-image",
          name: "image.url"
          exportparts: "L1:L2, L2:L3, L3:L4"
      ]
    ]

export { image }