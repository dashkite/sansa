import Wayland from "@dashkite/wayland"
import * as Posh from "@dashkite/posh"

import { Sites } from "@dashkite/aldera"

{ Handle, tag, sheets, start, activate, deactivate } = Wayland

import html from "./html"
import pending from "#templates/pending"
import css from "./css"

class extends Handle

  tag @, "sansa-view-sites"

  sheets @, [ css, Posh.component ]

  start ->
    @state = await Sites.View.resolve()

  activate @, ->
    @render pending()
    for await value from @state.start()
      @render html value

  deactivate @, -> @state.stop()
