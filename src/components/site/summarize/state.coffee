import * as DOM from "@dashkite/dominator"
import { Site } from "@dashkite/aldera"

import configuration from "#configuration"
{ origin } = configuration

state = ( base ) ->

  class extends base

    show: ->
      { site } = DOM.data @dom
      @state = await Site.resolve 
        site: { origin, bindings: { site }}
        internal: bindings: { site }   
      @state.listen() 

    hide: -> @state.close()

export default state