import Registry from "@dashkite/registry"
import * as W from "@dashkite/wayland"

import * as Posh from "@dashkite/posh"

import { Sites } from "@dashkite/aldera"

import html from "./html"
import pending from "#templates/pending"
import css from "./css"

class extends W.Handle

  @mixins [

    W.tag "sansa-view-sites"

    W.shadow

    W.render

    W.sheets [ css, Posh.component, Posh.animations ]

    W.start ->
      @state = await Sites.View.resolve()
      @render pending
      application = await Registry.get "application"
      for await sites from @state.listen()
        links =
          add: application.link name: "add site"
        @render html, { sites, links }

    W.reactor

  ]

