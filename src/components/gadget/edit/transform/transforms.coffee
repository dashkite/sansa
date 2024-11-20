import * as Obj from "@dashkite/joy/object"
import * as Text from "@dashkite/joy/text"
import { Gadget } from "@dashkite/talisa"
import * as Font from "#helpers/fonts"

Transforms =

  range:

    normalize: ({ options }, value ) ->
      if ( array = Gadget.Types.Enumerable[ options ])?
        array[ Text.parseNumber value ]
      else
        Text.parseNumber value

    denormalize: ({ options }, value ) ->
      if ( array = Gadget.Types.Enumerable[ options ])?
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

  fonts:

    normalize: ( specifier, value ) ->
      Font.sets[ Text.parseNumber value ]
      
    denormalize: ( specifier, value ) ->
      if value?
        Font.sets.findIndex ( set ) ->
          ( set.heading == value.heading ) &&
            ( set.copy == value.copy ) &&
              ( set.base == value.base )
      else 0

export default Transforms