import HTML from "@dashkite/html-render"
import Render from "./render"
import { icon } from "#helpers/icons"

empty = ( value ) -> !( value? && value.length > 0 )

template = ( state ) ->

  HTML.form [

    # We currently only have one state so it's
    # unnecessary to display a title and nav.
    # Keeping them here in case we add more 
    # complexity.

    # HTML.header part: "L1", [
    #   switch state.name
    #     when "home" then HTML.h1 "Select Icon"
    #     else HTML.h1 state.title
    # ]

    # HTML.nav [

    #   HTML.button 
    #     type: "button"
    #     name: "back"
    #     disabled: empty state.back
    #     [ 
    #       icon "back"
    #       HTML.span "Back" 
    #     ]

    #   HTML.button 
    #     type: "button"
    #     name: "forward"
    #     disabled: empty state.forward
    #     [
    #       HTML.span "Forward"
    #       icon "forward"
    #     ]

    # ]

    HTML.div class: "step", data: state: state.name,
      Render[ state.name ] state
  
  ]
  

export default template
