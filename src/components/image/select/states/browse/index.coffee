import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import files from "./files"

States = {
  
  files...

  "browse": 
    render: ({ gadget, template }) ->
      [

        HTML.nav [
          HTML.label [
            HTML.button name: "browse-files",  "Files"
            HTML.input name: "path", type: "file"
          ]
          HTML.button name: "browse-gadgets", "Gadgets"
          HTML.button name: "browse-unsplash", "Unsplash"
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
        name: "uploading"
        back: state

      
}

export default States