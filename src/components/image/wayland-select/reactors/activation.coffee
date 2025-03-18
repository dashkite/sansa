import * as Obj from "@dashkite/joy/object"
import { Image } from "@dashkite/aldera"

import Templates from "./html/templates"

bind = ( self, f ) -> f.bind self

activation = ( self ) ->

  bind self, ( reactor ) ->

    listen = =>
      for await event from @state.listen()
        @render Templates[ event.name ] @state

    active = false

    for await event from reactor
      switch event.name
        when "modified"
          @state.close()
          locator = Obj.mask [ "image" ], event.attributes.data
          @state = Image.resolve locator        
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