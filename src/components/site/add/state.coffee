import { Sites } from "@dashkite/aldera"
import configuration from "#configuration"
{ origin } = configuration

state = ( T ) ->
  T::activate = ->
    @state = await Sites.Add.resolve sites: { origin }
    @state.listen()
  T::deactivate = ->
    @state.close()

export default state