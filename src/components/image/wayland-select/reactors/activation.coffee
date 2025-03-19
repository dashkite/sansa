import * as Obj from "@dashkite/joy/object"
import { Image } from "@dashkite/aldera"

import pending from "#templates/pending"

activation = ( reactor ) ->

  listen = =>

    for await event from @state.listen()
      @render ( @templates[ event.name ] @state )

  active = false

  for await event from reactor
    switch event.name
      when "modified"
        @state.close()
        bindings = Obj.mask [ "image" ], event.attributes.data
        @state = Image.resolve bindings        
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