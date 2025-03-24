import * as Obj from "@dashkite/joy/object"
import DOM from "@dashkite/dominator"
import { Image } from "@dashkite/aldera"

import _html from "../html"

import pending from "#templates/pending"

activation = ( reactor ) ->

  # TODO mixin for binding template?
  #      is there a more elegant way to do this?
  html = _html.bind @

  resolve = =>
    @state ?= await Image.Select.resolve bindings: DOM.data @dom        

  listen = =>
    await resolve()
    for await event from @state.listen()
      console.log event
      @render html event
      
  active = false

  for await event from reactor
    switch event.name
      when "modified"
        @state.close()
        listen() if active
      when "activate"
        if !active
          active = true
          listen()
      when "deactivate"
        active = false
        @state.close()
      else
        yield event

export { activation }