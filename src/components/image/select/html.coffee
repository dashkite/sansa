import HTML from "@dashkite/html-render"
import Render from "./render"
import { icon } from "#helpers/icons"

empty = ( value ) -> !( value? && value.length > 0 )

template = ( state ) ->

  HTML.form [

    HTML.header part: "header", [
      HTML.h1 state.title
    ]

    HTML.nav [

      HTML.button 
        type: "button"
        name: "back"
        disabled: empty state.back
        [ 
          icon "back"
          HTML.span "Back" 
        ]

      HTML.button 
        type: "button"
        name: "forward"
        disabled: empty state.forward
        [
          HTML.span "Forward"
          icon "forward"
        ]

    ]

    HTML.div class: "step", data: state: state.name,
      Render[ state.name ] state
  
  ]
  

export default template





    # if gadget.image?
    #   HTML.img src: image.url
    # switch state?.step
    #   when "done"
    #     HTML.div class: "image", [
    #       HTML.img src: state.image.url
    #     ]

    #   when "upload"
    #     HTML.label [
    #       HTML.a href: "#browse", "Browse files..."
    #       HTML.input name: "path", type: "file", accept: "image/*"
    #     ]
    #   when "url"
    #     HTML.label [
    #       HTML.span "Image URL"
    #       HTML.input name: "url", type: "url"
    #     ]
    #   when "uploading"
    #     HTML.div class: "uploading", [
    #       HTML.span "Uploading..."
    #       HTML.img src: state.image.url
    #     ]
    #   else
    #     HTML.div class: "panel", [
    #       HTML.a href: "#upload", "Upload an image file"
    #       HTML.a href: "#url", "Provide a URL"
    #     ]