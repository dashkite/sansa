import { eventful } from "@dashkite/wayland"
import $ from "@dashkite/zest"

events = ( base = eventful()) ->

  class extends base

    @click()
      .within ".option"
      .apply ( event ) ->
        @dispatch "select",
          $ event.target
            .closest ".option"
            .data

export default events