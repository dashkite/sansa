import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

template = ( site ) ->
  [

    HTML.header part: "L1", [
      HTML.h1 site.title
    ]

    HTML.main [ HTML.p site.description ]

    HTML.footer [
      HTML.nav [

        await Render.link
          action: "edit"
          target: "site"
          bindings: site: site.address
          [ 
            HTML.i class: "ri-edit-box-line"
            "Edit" 
          ]

        await Render.link
          action: "remove"
          target: "site"
          bindings: site: site.address
          [ 
            HTML.i class: "ri-delete-bin-6-line"
            "Delete" 
          ]

      ]
    ]

  ]


export default template