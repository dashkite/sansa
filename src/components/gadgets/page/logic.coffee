import Registry from "@dashkite/registry"
import html from "./html"

logic = ( reactor ) ->

  # messages = await Registry.get "messages"
  # inbox = await Registry.get "message bar inbox"

  for await event from reactor
    console.log { event }
    switch event.name
      when "connect"
        # get the selected value from
        # the branch local state?
        @render html {}
    yield event
  return


export default logic