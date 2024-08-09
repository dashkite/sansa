import HTML from "@dashkite/html-render"
import States from "./states"

template = ({ gadget, state }) ->

  HTML.form [

    HTML.header part: "header", [
      HTML.h1 state.title
    ]

    HTML.nav [

      if state.back?
        HTML.a href: "#back", "Back"

      if state.forward?
        HTML.a href: "#forward", "Forward"
            
    ]

    HTML.div class: "step", data: state: state.name,
      States[ state.name ].render { gadget, state }
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