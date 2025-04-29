import * as DOM from "@dashkite/dominator"
import html from "./html"

logic = ( reactor ) ->
  for await event from reactor
    switch event.name
      when "connect"
        @render html, data: {}, errors: {}
      when "created"
        @dispatch "success"
      when "invalid"
        @render html,
          data: DOM.form @root
          errors: event.errors
      else
        yield event

export default logic