import {
  shadowed, renderable, styleable
  reactive, recurrent
} from "@dashkite/wayland"

import { Site } from "@dashkite/aldera"
import { component, icons } from "@dashkite/posh"

import stateful from "./state"
import { showtime } from "#reactors"
import logic from "./logic"
# import events from "./events"
import css from "./css"

class extends do Fn.pipe [
    shadowed
    renderable
    styleable
    reactive
    recurrent
    stateful
  ]

  @tag "site-tree"

  @sheets [ 
    css
    component
    icons
  ]

  @reactors [
    showtime
    logic    
  ]
