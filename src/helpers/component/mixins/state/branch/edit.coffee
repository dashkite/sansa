import * as DOM from "@dashkite/dominator"
import { Branch } from "@dashkite/aldera"

import configuration from "#configuration"
{ origin } = configuration

state = ( T ) ->

  T::show = ->
    { site, branch } = DOM.data @dom
    @state = await Branch.Edit.resolve 
      branch: { origin, bindings: { site, branch }}
      internal: bindings: { site, branch }   
    @state.listen() 

  T::hide = -> @state.close()

export default state