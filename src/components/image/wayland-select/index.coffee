import DOM from "@dashkite/dominator"
import * as W from "@dashkite/wayland"

import * as Posh from "@dashkite/posh"

import html from "./html"
import pending from "#templates/pending"
import css from "./css"
import { activation, timeline } from "./reactors"
import events from "./events"

class extends W.Handle

  @mixins [

    W.tag "wayland-select-image"

    W.shadow

    W.diff

    W.sheets [
      css
      Posh.component
      Posh.icons
    ]

    W.modified attributes: "data-image"

    W.activate
    W.deactivate

    W.reactors [
      timeline
      activation
    ]
  
    events

  ]

