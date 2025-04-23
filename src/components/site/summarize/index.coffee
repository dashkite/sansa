import * as DOM from "@dashkite/dominator"
import * as W from "@dashkite/wayland"

import * as Posh from "@dashkite/posh"

import * as R from "#reactors"

import state from "./state"
import logic from "./logic"
import css from "./css"

class extends W.Handle

  @mixins [

    W.tag "sansa-summarize-site"

    W.shadow

    W.render

    W.sheets [ 
      css
      Posh.component
      Posh.icons
      Posh.animations
    ]

    W.show
    W.hide

    state

    W.reactors [
      R.showtime
      logic
    ]


  ]
