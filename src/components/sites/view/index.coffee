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

    W.diff

    W.sheets [ css, Posh.component ]

    W.start ->
      @state = await Sites.View.resolve()

    W.activate ->
      @render pending()
      for await value from @state.listen()
        @render await html value

    W.deactivate -> @state.close()

  ]

