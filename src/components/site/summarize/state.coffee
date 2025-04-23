import * as DOM from "@dashkite/dominator"
import { Site } from "@dashkite/aldera"

import configuration from "#configuration"
{ origin } = configuration

state = ( T ) ->

  T::show = ->
    { site } = DOM.data @dom
    @state = await Site.View.resolve 
      site: { origin, bindings: { site }}
      internal: bindings: { site }   
    @state.listen() 

  T::hide = -> @state.close()

export default state