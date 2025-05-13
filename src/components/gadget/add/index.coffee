import { 
  shadowed, styleable, renderable,
  reactive, recurrent
} from "@dashkite/wayland"

import { 
  component, icons, forms, compact
} from "@dashkite/posh"

import { showtime } from "#reactors"
import stateful from "#state/branch/edit"

import events from "./events"
import logic from "./logic"
import css from "./css"

class extends do Fn.pipe [
    shadowed
    styleable
    renderable
    reactive
    recurrent
    stateful
    events
  ]

  @tag "sansa-add-gadget"

  @sheets [
    component
    icons
    forms
    compact
    css
  ]

  @reactors [
    showtime
    logic
  ]
