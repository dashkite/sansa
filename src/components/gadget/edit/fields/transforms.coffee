import * as Text from "@dashkite/joy/text"

Transforms =

  index: ( array ) ->
    normalize: ( value ) -> array[ Text.parseNumber value ]      
    denormalize: ( value ) -> 
      if ( index = array.indexOf value ) >= 0
        index
      else
        undefined

  boolean:
    normalize: ( value ) -> value == "on"
    denormalize: ( value ) -> value

export default Transforms