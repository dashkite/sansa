import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as W from "@dashkite/wayland"
import DOM from "@dashkite/dominator"

import Events from "#helpers/registries/events"

Events

  .get "wayland-select-image"

  .add W.click "button[name='browse files']",
    ( event ) ->
      do Fn.pipe [
        -> event.target
        DOM.closest "button"
        DOM.nextSibling
        DOM.action "click"
      ]

  .add W.click "button:not([name='browse files'])",
    ( event ) ->
      name = do Fn.pipe [
        -> event.target
        DOM.closest "button"
        DOM.attributes
        Obj.get "name"
      ]
      @state[ name ]()

