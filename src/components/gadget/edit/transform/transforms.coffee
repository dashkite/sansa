import * as Obj from "@dashkite/joy/object"
import * as Text from "@dashkite/joy/text"
import { Gadget } from "@dashkite/talisa"

warn = ( message ) ->
  console.warn "Transforms: #{ message }"

Transforms =

  range:

    normalize: ({ options }, value ) ->
      if ( array = Gadget.enumerable[ options ])?
        array[ Text.parseNumber value ]
      else
        warn "unknown enumerable [ #{ options } ]"

    denormalize: ({ options }, value ) ->
      if ( array = Gadget.enumerable[ options ])?
        if ( index = array.indexOf value ) >= 0
          index
        else
          undefined
      else
        warn "unknown enumerable [ #{ options } ]"

  boolean:

    normalize: ( specifier, value ) -> value == "on"
    denormalize: ( specifier, value ) -> value


export default Transforms