import * as Fn from "@dashkite/joy/function"
import * as DOM from "@dashkite/dominator"
import * as W from "@dashkite/wayland"
import * as Posh from "@dashkite/posh"

import * as R from "#reactors"
import logic from "./logic"
import state from "./state"
import templates from "./templates"
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
    
    W.click $[ "browse file button"], "browse files"
    W.click $[ "other buttons" ], "button action"

    W.change $[ "file input" ], "upload file"

    W.listen "search", $[ "search gadgets" ], "search gadget"
    W.change $[ "search gadgets" ], "select gadget"

    W.listen "search", $[ "search unsplash" ], ( domevent ) ->
      @state[ "search unsplash" ]
        term: domevent.target.value

    W.change $[ "search unsplash" ], "select unsplash image"

    W.change $[ "url input" ], "update url"
    
    state

    W.reactors [
      R.showtime
      R.timeline
      logic
    ]
  
  ]

