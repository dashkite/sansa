import HTML from "@dashkite/html-render"

template = ({ site, links }) ->
  [

    HTML.header part: "L1", [
      HTML.a href: links.edit, [ HTML.h1 site.title ]
    ]

    HTML.main [ HTML.p site.description ]

    HTML.footer [

      HTML.nav [

        HTML.a href:links.edit, [ 
          HTML.i class: "ri-edit-box-line"
          "Edit" 
        ]

        HTML.a href: links.remove, [
          HTML.i class: "ri-delete-bin-6-line"
          "Delete" 
        ]

      ]
    ]

  ]


export default template