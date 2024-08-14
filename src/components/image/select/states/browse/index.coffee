import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import files from "./files"
import gadgets from "./gadgets"
import unsplash from "./unsplash"

States = {
  
  files...

  gadgets...

  unsplash...

  "browse": 
    render: ({ gadget, template }) ->
      [

        HTML.nav [
          HTML.label [
            HTML.button type: "button", name: "browse-files",  "Files"
            HTML.input name: "path", type: "file"
          ]
          HTML.button type: "button", name: "browse-gadgets", "Gadgets"
          HTML.button type: "button", name: "browse-unsplash", "Unsplash"
        ]

      ]

    links:

      "browse-files": ({ state, event, handle }) ->
        target = event.target.closest "button"
        target.nextSibling.click()
        state

      "uploading": ({ state, event, handle }) ->
        handle.dispatch "change", 
          image: url: URL.createObjectURL event.target.files[0]
        title: "Browse Files"
        name: "uploading"
        back: state

      "browse-gadgets": ({ state }) ->
        title: "Browse Image Gadgets"
        name: "browse-gadgets"
        back: state

      "browse-unsplash": ({ state }) ->
        title: "Browse Unsplash Images"
        name: "browse-unsplash"
        back: state
      
}

export default States