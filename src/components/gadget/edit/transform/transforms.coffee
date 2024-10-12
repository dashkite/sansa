import * as Obj from "@dashkite/joy/object"
import * as Text from "@dashkite/joy/text"
import { Gadget } from "@dashkite/talisa"

Transforms =

  range:

    normalize: ({ options }, value ) ->
      if ( array = Gadget.enumerable[ options ])?
        array[ Text.parseNumber value ]
      else
        Text.parseNumber value

    denormalize: ({ options }, value ) ->
      if ( array = Gadget.enumerable[ options ])?
        if ( index = array.indexOf value ) >= 0
          index
        else
          undefined
      else
        value

  boolean:

    normalize: ( specifier, value ) -> value == "on"
    denormalize: ( specifier, value ) -> 
      if value == true then "on" else "off"


export default Transforms