import * as W from "@dashkite/wayland"
import $ from "@dashkite/zest"

eventful = ( base = W.eventful ) ->

  class extends base

    @click()
      .within ".option"
      .apply ( event ) ->
        @dispatch "select",
          $ event.target
            .closest ".option"
            .data

export default events