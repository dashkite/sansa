import HTML from "@dashkite/html-render"

template = ({ gadget, state }) ->

  HTML.main [
    if gadget.image?
      HTML.img src: image.url
    switch state?.step
      when "upload"
        HTML.label [
          HTML.a href: "#browse", "Browse files..."
          HTML.input name: "path", type: "file"
        ]
      when "url"
        HTML.label [
          HTML.span "Image URL"
          HTML.input name: "url", type: "url"
        ]
      else
        HTML.div class: "panel", [
          HTML.a href: "#upload", "Upload an image file"
          HTML.a href: "#url", "Provide a URL"
        ]
  ]
  
        

export default template