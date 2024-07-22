import * as K from "@dashkite/katana/async"
import data from "./data"

Mock =

  initialize: K.peek ({ site }) ->
    site.preferences ?= {}
    site.preferences.sizes ?= [ 25, 50, 25 ]
    site.branches ?= {}
    site.branches.main ?= data

export { Mock }
export default Mock