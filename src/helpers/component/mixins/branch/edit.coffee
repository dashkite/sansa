import $ from "@dashkite/zest"
import { Branch } from "@dashkite/aldera"

import configuration from "#configuration"
{ origin } = configuration

state = ( base ) ->

  class extends base

    show: ->
      { site, branch } = ( $ @dom ).data
      @state = await Branch.resolve 
        branch: { origin, bindings: { site, branch }}
        internal: bindings: { site, branch }   
      @state.listen() 

    hide: -> @state.close()

export default state