import HTML from "@dashkite/html-render"
import * as Page from "@dashkite/neon-drive"

template = ( site ) ->

  Links =
    edit: await Page.link
      action: "edit"
      target: "site"
      bindings: site: site.address

    remove: await Page.link
      action: "remove"
      target: "site"
      bindings: site: site.address

  [

    HTML.header part: "L1", [
      HTML.a href: Links.edit, [ HTML.h1 site.title ]
    ]

    HTML.main [ HTML.p site.description ]

    HTML.footer [

      HTML.nav [

        HTML.a href: Links.edit, [ 
          HTML.i class: "ri-edit-box-line"
          "Edit" 
        ]

        HTML.a href: Links.remove, [
          HTML.i class: "ri-delete-bin-6-line"
          "Delete" 
        ]

      ]
    ]

  ]


export default template