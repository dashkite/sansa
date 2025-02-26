import {
  Handle
  tag
  shadow
  diff
  sheets
  start
  activate
  deactivate 
} from "@dashkite/wayland"

import * as Posh from "@dashkite/posh"

import { Sites } from "@dashkite/aldera"

import html from "./html"
import pending from "#templates/pending"
import css from "./css"

class extends Handle

  tag @, "sansa-view-sites"

  shadow @

  diff @

  sheets @, [ css, Posh.component ]

  start @, ->
    @state = await Sites.View.resolve()

  activate @, ->
    @html = pending()
    for await value from @state.start()
      @html = await html value

  deactivate @, -> @state.stop()
