import $ from "@dashkite/zest"
import * as Time from "@dashkite/joy/time"
import Registry from "@dashkite/registry"

import pending from "#templates/pending"
import Templates from "./html/templates"
import html from "./html"

logic = ( reactor ) ->

  @messages = await Registry.get "messages"
  bar = await Registry.get "message bar inbox"

  await Templates.load()

  for await event from reactor

    { domevent } = event

    switch event.name

      when "browse files"
        $ domevent.target
          .closest "button"
          .next
          .click()

      when "button action"
        name = $ domevent.target
          .closest "button"
          .attributes
          .name
        @state[ name ]()

      when "upload file"
        url = $ domevent.target
          .files
          .url
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
        @state[ "select gadget" ] { url }
      
      when "search unsplash"
        @state[ "search unsplash" ]
          term: domevent.target.value
      
      when "select unsplash"
        url = domevent.target.value
        @dom.value = url
        @dispatch "change", url
        @state[ "select unsplash" ] { url }
      
      when "update url"
        url = domevent.target.value
        @dom.value = url
        @dispatch "change", url
        @state[ "set url" ] url

      when "uploaded file"
        @dispatch "change", event.url
        bar.enqueue 
          success: @messages.get [ "select image", "file uploaded successfully" ]

      when "browse unsplash"
        # skip rendering if we're behind
        # the current state of the input
        term =
          @root
            .querySelector "[name='term']"
            ?.value
        continue if term != event.term
        @render html, event
    
      when "browse gadgets", "home", "provide url", "uploading file"
        @render html, event

    yield event

  return

export default logic
