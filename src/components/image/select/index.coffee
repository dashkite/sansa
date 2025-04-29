import * as Fn from "@dashkite/joy/function"
import * as DOM from "@dashkite/dominator"
import * as W from "@dashkite/wayland"
import * as Posh from "@dashkite/posh"

import * as R from "#reactors"
import logic from "./logic"
import state from "./state"
import css from "./css"
import $ from "./selectors"


class extends W.Handle

  @mixins [

    W.tag "sansa-select-image"

    W.shadow

    W.render

    W.sheets [
      Posh.component
      Posh.icons
      Posh.forms
      Posh.compact
      css 
    ]

    W.modified attributes: [ "data-site", "data-image" ]

    W.show
    W.hide
    
    W.click "browse files", $[ "browse file button"]
    W.click "button action", $[ "other buttons" ]

    W.change "upload file", $[ "file input" ]

    W.listen "search", "search gadget", $[ "search gadgets" ]
    W.change "select gadget", $[ "search gadgets" ]

    W.listen "search", "search unsplash", $[ "unsplash autocomplete" ]
    W.change "select unsplash", $[ "unsplash field" ]

    W.change "update url", $[ "url input" ]

    state

    W.reactors [
      R.showtime
      R.timeline ({ scope }) -> scope == "component"
      logic
    ]
  
  ]
