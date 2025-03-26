import * as Obj from "@dashkite/joy/object"
import * as DOM from "@dashkite/dominator"
import Format from "@dashkite/format-text"

import { Image } from "@dashkite/aldera"

import configuration from "#configuration"
{ origin } = configuration

import { timeline } from "#helpers/reactors"
import pending from "#templates/pending"

import _html from "../html"

# TODO is this the best/only way to handle a timeline mixin?
class State extends Image.Select
  forward: -> @machine.send name: "forward"
  back: -> @machine.send name: "back"

activation = ( reactor ) ->

  # TODO mixin for binding template?
  #      is there a more elegant way to do this?
  html = _html.bind @

  resolve = =>
    { site, image } = DOM.data @dom
    @state ?= await State.resolve 
      site: { origin, bindings: { site }}
      internal: bindings: { image }      

  listen = =>
    await resolve()

    do =>
      for await event from ( timeline @state.listen())
        event.title = if event.name == "start"
          "Select Image"
        else 
          Format.title event.name
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