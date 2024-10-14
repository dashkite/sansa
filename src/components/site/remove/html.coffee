import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

template = ( site ) ->

  [

    HTML.header part: "L1", [
      HTML.h1 site.title
    ]
    HTML.main [
      HTML.p "Are you sure you want to delete this site?"
    ]
    HTML.footer [
      HTML.nav [
        HTML.button "Delete"
        HTML.a href: "#cancel", "Cancel"
      ]
    ]
    
  ]

export default template