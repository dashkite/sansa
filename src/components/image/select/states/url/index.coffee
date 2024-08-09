import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

States =

  "provide-url": 
    render: ({ gadget, template }) ->
      [

        Render.field
          label: "URL"
          hint: "A Web URL for the image"
          name: "url"
          type: "url"
          required: true

        HTML.nav [
          HTML.a href: "#done", "Done"
        ]

      ]

export default States