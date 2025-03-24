import * as W from "@dashkite/wayland"
import Events from "#helpers/registries/events"

selector = "[data-state='browse gadgets'] 
  vellum-autocomplete[name='term']"

Events

  .get "wayland-select-image"

  .add W.listen "search", selector, 
    ( event ) ->
      @state.channel.send name: "search gadgets",
        term: event.target.value

  .add W.change selector,
    ( event ) ->
      url = event.target.value
      @dom.value = url
      @dispatch "change", url
      # @state[ "select url" ]
