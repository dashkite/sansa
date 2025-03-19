import * as W from "@dashkite/wayland"
import { Events } from "#helpers/registries"

selector = "[data-state='browse unsplash']
  vellum-autocomplete[name='term']"

Events

  .get "wayland-select-image"

  .add W.listen "search", selector, 
    ( event ) ->
      @state.channel.send name: "search unsplash",
        term: event.target.value

  .add W.change selector,
    ( event ) ->
      url = event.target.value
      @dom.value = url
      @dispatch "change", url
      @state.channel.send { name: "select unsplash image", url }

