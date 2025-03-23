import * as W from "@dashkite/wayland"
import Events from "#helpers/registries/events"

Events

  .get "wayland-select-image"

  .add W.change "input[type='url']",
    ( event ) ->
      url = event.target.value
      @dom.value = url
      @dispatch "change", url
      @state.channel.send { name: "set url", url }
