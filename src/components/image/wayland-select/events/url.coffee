import * as W from "@dashkite/wayland"
import Events from "./registry"

Events

  .add W.change "vellum-field[type='url']",
    ( event ) ->
      url = event.target.value
      @dom.value = url
      @dispatch "change", url
      @state[ "set url" ] url
