import * as DOM from "@dashkite/dominator"
import * as Time from "@dashkite/joy/time"
import Format from "@dashkite/format-text"

import Messages from "#helpers/messages"
import pending from "#templates/pending"
import html from "./html"
import templates from "./templates"

title = ( name ) ->
  if Messages.has [ "select image", name ]
    Messages.get [ "select image", name ]
  else 
    Format.title name

logic = ( reactor ) ->

  for await event from reactor

    { domevent } = event

    switch event.name

      when "browse files"
        button = DOM.closest "button", domevent.target
        input = DOM.nextSibling button
        DOM.action "click", input

      when "button action"
        button = DOM.closest "button", domevent.target
        name = DOM.get "name", button
        @state[ name ]()

      when "upload file"
        file = domevent.target.files[0]
        url = URL.createObjectURL file
        @dom.value = url
        @dispatch "change", url
        @state[ "upload file" ] { url }      
      
      when "search gadget"
        @state[ "search gadgets" ]
          term: domevent.target.value

      when "select gadget"
        url = domevent.target.value
        @dom.value = url
        @dispatch "change", url
        # TODO should we send the URL here?
        #      or the gadget address?
        @state[ "select gadget" ] { url }
      
      when "search unsplash"
        @state[ "search unsplash" ]
          term: domevent.target.value
      
      when "select unsplash image"
        url = domevent.target.value
        @dom.value = url
        @dispatch "change", url
        @state[ "select unsplash image" ] { url }
      
      when "update url"
        url = domevent.target.value
        @dom.value = url
        @dispatch "change", url
        @state[ "set url" ] url

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

    if ( templates.get event.name )?
      event.title = title event.name
      await @render html.call @, event

      # make sure the success message is displayed
      # TODO is there a better way to handle this?
      #      we probably want use the message bar
      #      rather than render anything
      if event.name == "uploaded file"
        await Time.sleep 1000

    yield event

  return

export default logic
