import Handlers from "./handlers"
import "./file"

events = ( T ) -> T.mixins Handlers.registry

export default events