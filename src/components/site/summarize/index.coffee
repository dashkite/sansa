import Registry from "@dashkite/registry"
import * as DOM from "@dashkite/dominator"
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

    W.render

    W.sheets [ 
      css
      Posh.component
      Posh.icons
    ]

    W.reactor

    # TODO use modify/activate state machine?

    W.activate ->

      @render pending()

      application = await Registry.get "application"
      decorate = ( value ) ->
        value.links =
          edit: application.link
            name: "edit site"
            bindings: 
              site: value.site.address
          remove: application.link
            name: "remove site"
            bindings: 
              site: value.site.address
        value

      { data } = DOM.attributes @dom
      @state = await Site.View.resolve 
        site: { origin, bindings: data }
        internal: bindings: data

      for await value from @state.listen()
        if value.site?
          @render await html decorate value
      return
        
    W.deactivate -> @state.close()

  ]
