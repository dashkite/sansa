import * as W from "@dashkite/wayland"
import * as DOM from "@dashkite/dominator"

events = W.click ".option", ( event ) ->
  @dispatch "select",
    DOM.data DOM.closest ".option", event.target

export default events