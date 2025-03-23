import * as Obj from "@dashkite/joy/object"
import DOM from "@dashkite/dominator"
import { Image } from "@dashkite/aldera"

import pending from "#templates/pending"

activation = ( reactor ) ->

  resolve = =>
    @state ?= await Image.Select.resolve bindings: DOM.data @dom        

  listen = =>
    await resolve()
    for await event from @state.listen()
      console.log template: @templates
      @render ( @templates[ event.name ] @state )

  active = false

  for await event from reactor
    switch event.name
      when "modified"
        @state.close()
        listen() if active
      when "activate"
        if !active
          active = true
          listen()
      when "deactivate"
        active = false
        @state.close()
      else
        yield event

export { activation }