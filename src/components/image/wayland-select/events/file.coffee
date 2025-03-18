import * as W from "@dashkite/wayland"
import Handlers from "./handlers"

Handlers.add do ->

  W.change "input[type='file']", ( event ) ->
    file = event.target.files[0]
    url = URL.createObjectURL file
    @dom.value = url
    @dispatch "change", url
    @state.channel.send { name: "file upload", url }
