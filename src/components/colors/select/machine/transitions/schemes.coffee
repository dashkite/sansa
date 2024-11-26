import { producer as P } from "@dashkite/colorist"
# import { CanvasImage, getPalette } from "@dashkite/color-thief"

schemes = ( state ) ->
  # if chroma < 0.2
  #   create grayscale theme
  # else
  producer = P.monochromatic.create state.color


export { schemes }