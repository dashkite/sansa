import URL from "./url"
import start from "./start"
import meta from "./meta"

States = {
  next: ( name, state ) ->
    action = States[ state.name ]?.links?[ name ] ? States.meta.links[ name ]
    action.apply null, [ state ]
  meta
  start
  URL...
}

export default States