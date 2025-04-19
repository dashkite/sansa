import * as W from "@dashkite/wayland"
import * as Posh from "@dashkite/posh"

import * as R from "#reactors"
import * as M from "#mixins"

import state from "./state"
import logic from "./logic"

import css from "./css"

class extends W.Handle

  @mixins [

    W.tag "sansa-add-site"

    W.shadow

    W.render

    W.sheets [ 
      css
      Posh.component
      Posh.forms
      Posh.animations
      Posh.icons
    ]

    W.activate
    W.deactivate
    M.validate
    state

    W.reactors [
      R.activator
      R.inductor
      R.toggle
      logic
    ]

    W.click "[href='#cancel']", -> history.back()

    W.submit ( data ) -> @state[ "add site" ] data

  ]
