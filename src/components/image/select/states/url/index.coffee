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
          HTML.button name: "done", "Done"
        ]

      ]

    links:

      "done": ({ state, event, handle }) ->
        target = handle.root.querySelector "input[name='url']"
        handle.dom.value = target.value
        handle.dispatch "change", detail: target.value
        name: "start"
        back: state


export default States