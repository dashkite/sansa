import $ from "@dashkite/zest"
import html from "./html"

logic = ( reactor ) ->
  for await event from reactor
    switch event.name
      when "connect"
        @render html data: {}, errors: {}
      when "created"
        @dispatch "success"
      when "invalid"
        @render html
          data: ( $ @root ).form.data
          errors: event.errors
      else
        yield event

export default logic