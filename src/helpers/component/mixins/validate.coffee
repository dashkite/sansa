import * as W from "@dashkite/wayland"
import _validate from "@dashkite/validator"

validate = W.nullary "invalid", ( T ) ->
  W.start T, ->
    for await errors from _validate @root
      @channel.send { name: "invalid", errors }

export { validate }