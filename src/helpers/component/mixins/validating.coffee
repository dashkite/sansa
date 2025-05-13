import * as W from "@dashkite/wayland"
import validate from "@dashkite/validator"

validating = ( base ) ->
  class extends base
    @start ->
      for await errors from validate @root
        @channel.send { name: "invalid", errors }

export { validating }