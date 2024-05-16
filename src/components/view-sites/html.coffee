import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

template = ( profile ) ->
  
  HTML.render [
    HTML.slot name: "header", [
      HTML.header part: "header", [
        HTML.h1 "Sites"
      ]
    ]
    HTML.main await do ->
      if profile.sites.length > 0
        for site in profile.sites
          Render.component
            prefix: "sansa"
            action: "view"
            target: "site"
            bindings: { site }

      else [
        HTML.p [
          "You haven't created any sites yet.
            Would you like to "
          await Render.link
            action: "create"
            target: "site"
            [ "create one" ]
          "?"
        ]
      ]
      # else do ->

      #   available = await Page.available
      #     action: "create"
      #     target: "site"
        
      #   if available?
        
      #   HTML.p [
      #     "You haven't created any sites yet.
      #       Would you like to "
      #     Render.link
      #       action: "create"
      #       target: "site"
      #       [ "create one" ]
      #     "?"
      #   ]
          
      # ]
  ]

export default template