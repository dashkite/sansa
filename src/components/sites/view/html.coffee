import HTML from "@dashkite/html-render"

template = ({ links, sites }) ->

  [

    HTML.header part: "L1", [
      HTML.slot name: "header", [
        HTML.h1 "Sites"
      ]
    ]

    if sites.length > 0
      HTML.main do ->
        for { address } in sites
          HTML.tag "sansa-summarize-site", 
            exportparts: "L1:L2, L2:L3, L3:L4"
            data: site: address

    else
      HTML.main [
        HTML.p [
          "You haven't created any sites yet.
            Would you like to "
          HTML.a href: links.add, "create one"
          "?"
        ]
      ]

    HTML.footer [
      HTML.nav [
        HTML.a href: links.add, "Create a new site"
      ]
    ]

  ]

export default template