import HTML from "@dashkite/html-render"
import Render from "./render"
import { icon } from "#helpers/icons"

empty = ( value ) -> !( value? && value.length > 0 )

template = ( state ) ->

  HTML.form [

    HTML.div class: "step", data: state: state.name,
      Render[ state.name ] state
  
  ]
  

export default template
