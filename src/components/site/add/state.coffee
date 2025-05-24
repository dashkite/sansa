import { Sites } from "@dashkite/aldera"
import configuration from "#configuration"
{ origin } = configuration

state = ( base ) ->

  class extends base

    show: ->
      @state = await Sites.resolve sites: { origin }
      @state.listen()

    hide: -> @state.close()

export default state