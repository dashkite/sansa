import * as W from "@dashkite/wayland"
import Events from "#helpers/registries/events"


Events

  .get "wayland-select-image"

  .add W.change "input[type='file']", 
    ( event ) ->
      file = event.target.files[0]
      url = URL.createObjectURL file
      @dom.value = url
      @dispatch "change", url
      @state[ "upload file" ] { url }
