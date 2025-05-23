import * as DOM from "@dashkite/dominator"
import { Branch } from "@dashkite/aldera"

import configuration from "#configuration"
{ origin } = configuration

state = ( base ) ->

  class extends base

    show: ->
      { site, branch } = DOM.data @dom
      @state = await Branch.resolve 
        branch: { origin, bindings: { site, branch }}
        internal: bindings: { site, branch }   
      @state.listen() 

    hide: -> @state.close()

export default state