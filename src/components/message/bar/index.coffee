import * as DOM from "@dashkite/dominator"
import Registry from "@dashkite/registry"
import * as W from "@dashkite/wayland"
import * as Posh from "@dashkite/posh"

import html from "./html"
import css from "./css"

class extends W.Handle

  @mixins [

    W.tag "message-bar"

    W.shadow

    W.render

    W.sheets [
      Posh.component
      Posh.icons
      Posh.compact
      css 
    ]

    W.listen "animationend", "next", ".container"

    W.reactors ( reactor ) ->
      messages = await Registry.get "messages"
      inbox = await Registry.get "message bar inbox"

      for await event from reactor
        switch event.name
          when "connect", "next"
            @render html
            message = await inbox.dequeue()
            @render html, message
        yield event
      return
  
  ]

