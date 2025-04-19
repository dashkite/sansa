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
