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

    W.activate
        
    W.deactivate

    state

    W.reactors [
      R.activator
      R.inductor
      R.toggle
      logic    
    ]
  ]
