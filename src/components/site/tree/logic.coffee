import $ from "@dashkite/zest"
import Registry from "@dashkite/registry"

import pending from "#templates/pending"
import html from "./html"

logic = ( reactor ) ->

  messages = await Registry.get "messages"
  bar = await Registry.get "message bar inbox"

  for await event from reactor

    console.log { event }
    
    { snapshot } = event

    switch event.name

      when "connect"
        @render html()

    yield event

  return

export default logic
