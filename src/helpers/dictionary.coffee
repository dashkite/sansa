import * as Text from "@dashkite/joy/text"

Dictionary =

  dashed: ( dictionary ) ->
    result = {}
    for key, value of dictionary
      result[ Text.dashed key ] = value
    result

export default Dictionary