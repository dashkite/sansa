import * as Text from "@dashkite/joy/text"
import { CanvasImage, getPalette } from "@dashkite/color-thief"
import { palette as P } from "@dashkite/colorist"

assign = ( context ) -> ( state ) -> Object.assign state, context

Transitions =
  default: run: ( talos, { context }) ->
    talos.context.state.plan assign context

Color =

  fromImage: ( context ) ->
    new Promise ( resolve, reject ) ->
      try
        image = document.createElement "img"
        image.addEventListener "load", ->
          source = CanvasImage.create { canvas, image }
          palette = P.fromTriples "rgb", 
            "Shallow Palette", 
            getPalette { source, colorCount: 2, quality: 1 }
          resolve do -> 
            ( palette.get "1" )
              .color
              .toGamut space: "srgb"
              .to "srgb"
              .toString format: "hex"

        image.crossOrigin = "anonymous"
        image.style.width = "20rem"
        image.src = context.image

        canvas = document.createElement "canvas"
        canvas.style.width = "20rem"
        canvas.style.height = "20rem"

        workspace = new DocumentFragment
        workspace.append image, canvas
      catch error
        reject error

Transitions =

  home:
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        # home is our initilaization, so our state
        # if it exists, comes frmo the DOM value,
        # while the context is the default state.
        # thus we overwrite the default with any
        # values we get from the DOM. this is
        # the reverse of the transitions driven
        # by events (all the rest of them)
        Object.assign context, state

  "select image":
    run: ( talos, { context }) ->
      talos.context.state.plan ( state ) ->
        Object.assign state, color: await Color.fromImage context

  "select color input": Transitions.default
  "select color": Transitions.default
  "select family": Transitions.default
  "select intensity": Transitions.default
  "select gradient": Transitions.default
  "select background": Transitions.default

export default Transitions