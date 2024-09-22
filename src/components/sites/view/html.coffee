import HTML from "@dashkite/html-render"
import * as Page from "@dashkite/neon-drive"

template = ( profile ) ->
  
  HTML.render [
    HTML.slot name: "header", [
      HTML.header part: "header", [
        HTML.h1 "Sites"
      ]
    ]
    HTML.main await do ->
      if profile.sites.length > 0
        [

          HTML.div do ->
            for address in profile.sites
              HTML.tag "sansa-summarize-site",
                data: site: address

          HTML.footer [
            HTML.nav [
              await Render.link
                action: "create"
                target: "site"
                [ "Create a new site" ]
            ]
          ]

        ]

      else
        href = await Page.link action: "create", target: "site"
        [
          HTML.p [
            "You haven't created any sites yet.
              Would you like to "
            HTML.a { href }, [ "create one" ]
            "?"
          ]
        ]


  ]

export default template