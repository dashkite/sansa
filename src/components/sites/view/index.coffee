import Registry from "@dashkite/registry"
import {
  shadowed, renderable, styleable, reactive
} from "@dashkite/wayland"

import { component, animations } from "@dashkite/posh"

import { Sites } from "@dashkite/aldera"

import html from "./html"
import pending from "#templates/pending"
import css from "./css"

class extends do Fn.pipe [
    shadowed
    renderable
    styleable
    reactive
  ]

  @tag "sansa-view-sites"

  @sheets [ css, component, animations ]

  @start ->
    @render pending
    application = await Registry.get "application"
    @state = await Sites.View.resolve()
    for await sites from @state.listen()
      links =
        add: application.link name: "add site"
      @render html, { sites, links }


