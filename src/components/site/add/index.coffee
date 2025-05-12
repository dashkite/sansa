import {
  shadowed, renderable, styelable, reactive, 
  recurrent, stateful, eventful
} from "@dashkite/wayland"

import { component, forms, animations, icons } from "@dashkite/posh"

import { showtime } from "#reactors"
import { validating } from "#mixins"

import css from "./css"

import stateful from "./state"
import logic from "./logic"

class extends do Fn.pipe [
    shadowed, renderable, styelable, reactive, 
    recurrent, stateful, eventful
  ]

  @tag "sansa-add-site"

  @sheets [ 
    css
    component
    forms
    animations
    icons
  ]

  @reactors [
    showtime
    logic
  ]

  @click()
    .matches "[href='#cancel']"
    .apply -> history.back()

  @submit()
    # TODO automatically get form data?
    .apply ( data ) -> 
      @state[ "add site" ] data
