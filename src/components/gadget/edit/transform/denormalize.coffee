import Generic from "@dashkite/generic"
import Schema from "../schema"
import * as Transforms from "./transforms"

denormalize = Generic.make "denormalize"

  .define [ Object ], ({ context..., data }) ->
    data = collapse data
    result = {}
    for field in Schema.get data
      result[ field.name ] = do ->
        if ( Transform = Transforms[ specifier.type ])?
          Transform.denormalize field, data[ field.name ]
        else value
    result

export { denormalize }