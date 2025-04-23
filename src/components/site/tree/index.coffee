import Registry from "@dashkite/registry"
import * as DOM from "@dashkite/dominator"
import * as W from "@dashkite/wayland"

import { Site } from "@dashkite/aldera"
import * as Posh from "@dashkite/posh"

import configuration from "#configuration"
{ origin } = configuration

import state from "./state"
import * as R from "#reactors"
import logic from "./logic"
# import events from "./events"
import css from "./css"

class extends W.Handle

  @mixins [

    W.tag "site-tree"

    W.shadow

    W.render

    W.sheets [ 
      css
      Posh.component
      Posh.icons
    ]

    W.show
        
    W.hide

    state

    W.reactors [
      R.showtime
      logic    
    ]
  ]
