import * as Fn from "@dashkite/joy/function"
import * as Time from "@dashkite/joy/time"
import * as DOM from "@dashkite/dominator"
import Format from "@dashkite/format-text"

import { Image } from "@dashkite/aldera"

import configuration from "#configuration"
{ origin } = configuration

import Timeline from "#helpers/reactors/timeline"
import Messages from "#helpers/messages"
import pending from "#templates/pending"

import _html from "../html"

title = ( name ) ->
  if Messages.has [ "select image", name ]
    Messages.get [ "select image", name ]
  else 
    Format.title name

State = Timeline.mixin Image.Select

logic = ( reactor ) ->
  

  # TODO mixin for binding template?
  #      is there a more elegant way to do this?
  html = _html.bind @

  resolve = =>
    { site, image } = DOM.data @dom
    @state = await State.resolve 
      site: { origin, bindings: { site }}
      internal: bindings: { image }    

  _logic = ( reactor ) =>

    for await event from reactor
      switch event.name

        when "uploaded file"
          @dispatch "change", event.url

        # skip rendering if we're behind
        # the current state of the input
        when "browse unsplash"
          term =
            @root
              .querySelector "[name='term']"
              ?.value
          continue if term != event.term

      event.title = title event.name
      await @render html event
      # make sure the success message is displayed
      # TODO is there a better way to handle this?
      #      we probably want use the message bar
      #      rather than render anything
      if event.name == "uploaded file"
        await Time.sleep 1000
    return

  listen = Fn.pipe [
    => @state.listen()
    Timeline.reactor
    _logic
  ]
      
  close = => @state.close()

  for await event from reactor
    switch event.name
      when "resolve"
        await resolve() 
      when "listen"
        listen()
      when "close"
        close()
      else
        yield event

  return
  
export { logic }
