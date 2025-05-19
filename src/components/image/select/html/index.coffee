import HTML from "@dashkite/domo"
import Format from "@dashkite/format-text"
import { icon } from "#helpers/icons"
import templates from "./templates"

template = ( event, messages ) ->

  title = messages.title [ "select image", event.name ]

  HTML.form [

    HTML.header part: "L1", [
      HTML.h1 title
    ]

    HTML.nav [

      HTML.button 
        type: "button"
        name: "back"
        disabled: !event.back
        [ 
          icon "back"
          HTML.span "Back" 
        ]

      HTML.button 
        type: "button"
        name: "forward"
        disabled: !event.forward
        [
          HTML.span "Forward"
          icon "forward"
        ]

    ]

    HTML.div class: "step", data: state: event.name,
      templates.apply event.name, [ event, messages ]
  
  ]

export default template
