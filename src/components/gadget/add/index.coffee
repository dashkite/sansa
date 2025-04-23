import * as W from "@dashkite/wayland"
import * as Posh from "@dashkite/posh"

import * as R from "#reactors"
import state from "#state/branch/edit"

import events from "./events"
import logic from "./logic"
import css from "./css"

class extends W.Handle

  @mixins [

    W.tag "sansa-add-gadget"
    W.shadow
    W.render

    W.sheets [
      Posh.component
      Posh.icons
      Posh.forms
      Posh.compact
      css 
    ]

    state
    events

    W.show
    W.hide

    W.reactors [
      R.showtime
      logic
    ]

  ]
