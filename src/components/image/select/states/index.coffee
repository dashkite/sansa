import URL from "./url"
import browse from "./browse"
import start from "./start"
import meta from "./meta"

States = {
  next: ( name, context ) ->
    { state } = context
    action = States[ state.name ]?.links?[ name ] ? States.meta.links[ name ]
    action.apply null, [ context ]
  meta
  start
  URL...
  browse...
}

export default States