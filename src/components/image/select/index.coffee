import * as Fn from "@dashkite/joy/function"
import * as DOM from "@dashkite/dominator"
import {
  shadowed, renderable, styleable
  reactive, recurrent, observable
  eventful
} from "@dashkite/wayland"

import { component, icons, forms, compact } from "@dashkite/posh"

import { timeline, showtime } from "#reactors"

import logic from "./logic"
import state from "./state"
import css from "./css"
import $ from "./selectors"

class extends do Fn.pipe [
    shadowed, renderable, styleable
    reactive, recurrent, observable
    eventful, state
  ]

  @tag "sansa-select-image"

  @sheets [
    component
    icons
    forms
    compact
    css 
  ]

  @observe.attributes [ "data-site", "data-image" ]

  @click()
    .matches $[ "browse file button"]
    .send "browse files"

  @click()
    .matches $[ "other buttons" ]
    .send "button action"

  @change()
    .matches $[ "file input" ]
    .send "upload file"

  @listen "search"
    .matches $[ "search gadgets" ]
    .send "search gadget"
  
  @change()
    .matches $[ "search gadgets" ]
    .send "select gadget"

  @listen "search"
    .matches $[ "unsplash autocomplete" ]
    .send "search unsplash"
  
  @change()
    .matches $[ "unsplash field" ]
    .send "select unsplash"

  @change()
    .matches $[ "url input" ]
    .send "update url"

  @reactors [
    showtime
    timeline ({ scope }) -> scope == "component"
    logic
  ]

