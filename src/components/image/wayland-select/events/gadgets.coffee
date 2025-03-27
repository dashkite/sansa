import * as W from "@dashkite/wayland"
import Events from "./registry"

selector = "[data-state='browse gadgets'] 
  vellum-autocomplete[name='term']"

Events

  .add W.listen "search", selector, 
    ( event ) ->
      @state[ "search gadgets" ]
        term: event.target.value

  .add W.change selector,
    ( event ) ->
      url = event.target.value
      @dom.value = url
      @dispatch "change", url
      # TODO should we send the URL here?
      #      or the gadget address?
      @state[ "select gadget" ] { url }
