import * as K from "@dashkite/katana/async"
import data from "./data"

Mock =

  initialize: K.peek ({ site }) ->
    Object.assign site, data

export { Mock }
export default Mock