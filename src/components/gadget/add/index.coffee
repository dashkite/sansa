import * as W from "@dashkite/wayland"
import * as Posh from "@dashkite/posh"

import html from "./html"
import css from "./css"

class extends W.Handle

  @mixins [

    W.tag "sansa-add-gadget"
    W.render

    W.sheets [
      Posh.component
      Posh.icons
      Posh.forms
      Posh.compact
      css 
    ]

    W.reactor

    W.start -> @render html gadgets: []

    W.click ".option", ( event ) ->
      option = DOM.closet ".option", event.target
      DOM.dispatch @dom, "select", DOM.data option
  
  ]
