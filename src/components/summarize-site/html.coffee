import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

template = ( site ) ->

  HTML.render [

    HTML.main [

      HTML.header part: "header", [
        HTML.h1 site.name
      ]
      HTML.div [
        HTML.p site.description
      ]
      HTML.footer [
        HTML.nav [
          await Render.link
            action: "view"
            target: "site"
            bindings: site: site.address
            [ "Detail" ]
        ]
      ]
    ]
  ]

export default template