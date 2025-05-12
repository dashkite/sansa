import { 
  shadowed, styleable, renderable,
  reactive, recurrent
} from "@dashkite/wayland"

import { 
  component, icons, forms, compact
} as Posh from "@dashkite/posh"

import { showtime } from "#reactors"
import stateful from "#state/branch/edit"

import eventful from "./events"
import logic from "./logic"
import css from "./css"

class extends do Fn.pipe [
    shadowed
    styleable
    renderable
    reactive
    recurrent
    stateful
    eventful
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
