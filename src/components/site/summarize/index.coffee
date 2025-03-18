import DOM from "@dashkite/dominator"
import * as W from "@dashkite/wayland"

import { Site } from "@dashkite/aldera"
import * as Posh from "@dashkite/posh"


import configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import pending from "#templates/pending"
import css from "./css"

class extends W.Handle

  @mixins [

    W.tag "sansa-summarize-site"

    W.shadow

    W.diff

    W.sheets [ 
      css
      Posh.component
      Posh.icons
    ]

    # TODO use modify/activate state machine?
    W.activate ->
      @render pending()
      { data } = DOM.attributes @dom
      @state = await Site.View.resolve { origin, bindings: data }
      for await value from @state.listen()
        @render await html value
      return
        
    W.deactivate -> @state.close()

  ]

