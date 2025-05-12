import * as DOM from "@dashkite/dominator"
import {
  shadowed, renderable, styleable
  reactive, recurrent
} from "@dashkite/wayland"

import { component, icons, animations } from "@dashkite/posh"

import { showtime } from "#reactors"

import stateful from "./state"
import logic from "./logic"
import css from "./css"

class extends do Fn.pipe [
    shadowed, renderable, styleable
    reactive, recurrent, stateful
  ]

  @tag "sansa-summarize-site"

  @sheets [ 
    css
    component
    icons
    animations
  ]

  @reactors [
    showtime
    logic
  ]