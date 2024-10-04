import Generic from "@dashkite/generic"
import schema from "../schema"
import Transforms from "./transforms"
import { collapse } from "./helpers"

denormalize = Generic.make "denormalize"

  .define [ Object ], ( data ) ->
    data = collapse data
    result = {}
    for field in schema data
      result[ field.name ] = do ->
        if ( Transform = Transforms[ field.type ])?
          Transform.denormalize field, data[ field.name ]
        else data[ field.name ]
    result

export { denormalize }