import { Gadgets } from "@dashkite/talisa"

import html from "./html"

logic = ( reactor ) ->

  for await event from reactor
    console.log { event }

    switch event.name

      when "value"
        if event.value.branch?
          @render html gadgets: Gadgets.from event.value.branch

    yield event

export default logic