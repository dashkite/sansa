import HTML from "@dashkite/html-render"

# TODO customize hint for different contexts
#      how do we want to handle this generally?

image = ( value, { gadget, state }) ->
  HTML.tag "vellum-field",
    name: "image"
    label: "Image"
    hint: "The image to display."
    [

      HTML.div class: "image", [
        HTML.div class: "thumbnail", [
          HTML.img src: value
        ]
      ]

      HTML.tag "sansa-select-image"
        attributes:
          name: "image.url"
          exportparts: "L1:L2, L2:L3, L3:L4"

    ]

export { image }