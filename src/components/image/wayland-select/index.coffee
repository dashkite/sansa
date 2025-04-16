import * as DOM from "@dashkite/dominator"
import * as W from "@dashkite/wayland"
import * as Posh from "@dashkite/posh"

import { activation, resolution } from "#reactors"
import { logic } from "./reactors"
import events from "./events"
import templates from "./templates"
import css from "./css"

class extends W.Handle

  @mixins [

    W.tag "wayland-select-image"

    W.shadow

    W.render

    templates

    events

    W.sheets [
      Posh.component
      Posh.icons
      Posh.forms
      Posh.compact
      css 
    ]

    W.connect -> console.log "connect!"
    W.disconnect -> console.log "disconnect!"

    W.modified attributes: [ "data-site", "data-image" ]

    W.activate
    W.deactivate

    W.reactors [
      activation      
      resolution 
      logic
    ]
  
  ]

