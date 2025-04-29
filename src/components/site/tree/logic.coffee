import pending from "#templates/pending"
import html from "./html"

logic = ( reactor ) ->

  @render pending

  for await event from reactor
    switch event.name
      when "value"
        await @render html, event
      else
        yield event
  return

export default logic
