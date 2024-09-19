import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import { icon } from "#helpers/icons"

page = ( value, { gadget, state }) ->

  Render.field
    name: "page"
    label: "Page"
    hint: "A Page of your site"
    type: "custom"
    html: HTML.div [

      HTML.div if value?
        [
          icon "page"
          HTML.span value
        ]
      else
        [ HTML.span "No page selected" ]

      Render.component
        prefix: "sansa"
        action: "select"
        target: "page"
        attributes:
          name: "page"
          exportparts: "L1:L2, L2:L3, L3:L4"
    ]

export { page }
