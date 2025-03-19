import DOM from "@dashkite/dominator"
import * as W from "@dashkite/wayland"
import * as Posh from "@dashkite/posh"

import { timeline } from "#helpers/reactors"

import { activation } from "./reactors"
import events from "./events"
import templates from "./templates"
import css from "./css"

class extends W.Handle

  @mixins [

    W.tag "wayland-select-image"

    W.shadow

    W.diff

    templates

    events

    W.sheets [
      css
      Posh.component
      Posh.icons
    ]

    W.modified attributes: [ "data-image" ]

    W.activate
    W.deactivate

    W.reactors [
      timeline
      activation        
    ]
  
  ]

