import * as Obj from "@dashkite/joy/object"
import DOM from "@dashkite/dominator"
import { Image } from "@dashkite/aldera"

import configuration from "#configuration"
{ origin } = configuration

import pending from "#templates/pending"

import _html from "../html"

activation = ( reactor ) ->

  # TODO mixin for binding template?
  #      is there a more elegant way to do this?
  html = _html.bind @

  resolve = =>
    { site, image } = DOM.data @dom
    @state ?= await Image.Select.resolve 
      site: { origin, bindings: { site }}
      internal: bindings: { image }      

  listen = =>
    await resolve()
    do =>
      for await event from @state.listen()
        console.log event
        @render html event
      return
    return
      
  active = false

  for await event from reactor
    switch event.name
      when "modified"
        @state.close()
        await listen() if active
      when "activate"
        if !active
          active = true
          await listen()
      when "deactivate"
        active = false
        @state.close()
      else
        yield event

export { activation }