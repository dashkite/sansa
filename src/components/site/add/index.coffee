import * as Fn from "@dashkite/joy/function"
import {
  shadowed, renderable, styleable, 
  reactive, recurrent, eventful
} from "@dashkite/wayland"

import { component, forms, animations, icons } from "@dashkite/posh"

import { showtime } from "#reactors"
import { validating } from "#mixins"

import css from "./css"

import state from "./state"
import logic from "./logic"

class extends do Fn.pipe [
    shadowed, renderable, styleable, 
    reactive, recurrent, eventful
    state
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
    .apply ( event ) -> 
      @state[ "add site" ] do ->
        $ event.target
          .form
          .data
