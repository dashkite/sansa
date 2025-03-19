import * as Fn from "@dashkite/joy/function"
import * as W from "@dashkite/wayland"
import { Events } from "#helpers/registries"

Events

  .get "wayland-select-image"

  .add W.click "button[name='browse files']",
    ( event ) ->
      do Fn.pipe [
        -> event.target
        DOM.closest "button"
        DOM.nextSibling
        DOM.click
      ]

  .add W.click "button:not([name='browse files'])",
    ( event ) ->
      name = do Fn.pipe [
        -> event.target
        DOM.closest "button"
        DOM.attributes
        Obj.get "name"
      ]
      @state.channel.send { name }
