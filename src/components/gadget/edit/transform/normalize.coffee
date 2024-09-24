import Generic from "@dashkite/generic"
import Schema from "../schema"
import * as Transforms from "./transforms"

normalize = Generic.make "normalize"

  .define [ Object ], ({ context..., data }) ->
    result = {}
    for field in Schema.get data
      result[ field.name ] = do ->
        if ( Transform = Transforms[ specifier.type ])?
          Transform.normalize field, data[ field.name ]
        else data[ field.name ]
    expand result

export { normalize }