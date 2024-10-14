import HTML from "@dashkite/html-render"
import * as Page from "@dashkite/neon-drive"

template = ( profile ) ->

  Links = add: await Page.link action: "add", target: "site"

  [

    HTML.header part: "L1", [
      HTML.slot name: "header", [
        HTML.h1 "Sites"
      ]
    ]

    if profile.sites.length > 0
      HTML.main do ->
        for { address } in profile.sites
          HTML.tag "sansa-summarize-site", 
            exportparts: "L1:L2, L2:L3, L3:L4"
            data: site: address

    else
      HTML.main [
        HTML.p [
          "You haven't created any sites yet.
            Would you like to "
          HTML.a href: Links.add, "create one"
          "?"
        ]
      ]

    HTML.footer [
      HTML.nav [
        HTML.a href: Links.add, "Create a new site"
      ]
    ]

  ]

export default template