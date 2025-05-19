import * as Fn from "@dashkite/joy/function"

import {
  shadowed, renderable, styleable
  reactive, recurrent, eventful
} from "@dashkite/wayland"

import { 
  animations, icons, component
  forms, compact 
} from "@dashkite/posh"

import { showtime } from "#reactors"

import state from "#mixins/branch/edit"
import logic from "./logic"

import css from "./css"

class extends do Fn.pipe [
    shadowed, renderable, styleable
    recurrent, reactive, eventful
    state
  ]

  @tag "page-editor"

  @sheets [
    animations, icons, component
    forms, compact
  ]

  @reactors [
    showtime
    logic
  ]

