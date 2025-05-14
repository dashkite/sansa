import { eventful } from "@dashkite/wayland"
import $ from "@dashkite/zest"

events = ( base ) ->

  class extends eventful base

    @click()
      .within ".option"
      .apply ( event ) ->
        @dispatch "select",
          $ event.target
            .closest ".option"
            .data

export default events