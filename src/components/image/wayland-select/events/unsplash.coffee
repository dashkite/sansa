import * as W from "@dashkite/wayland"
import Events from "./registry"

Selectors =
  search: "[data-state='browse unsplash']
    vellum-autocomplete[name='term']"
  input: "[data-state='browse unsplash']
    vellum-field[name='search']"

Events

  .add W.listen "search", Selectors.search, 
    ( event ) ->
      @state[ "search unsplash" ]
        term: event.target.value

  .add W.change Selectors.input,
    ( event ) ->
      url = event.target.value
      @dom.value = url
      @dispatch "change", url
      @state[ "select unsplash image" ] { url }

