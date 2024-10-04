import Generic from "@dashkite/generic"
import { Gadget } from "@dashkite/talisa"
import schema from "../schema"
import Transforms from "./transforms"
import { expand } from "./helpers"

normalize = Generic.make "normalize"

  .define [ Object, Gadget ], ( data, gadget ) ->
    result = {}
    for field in schema gadget
      result[ field.name ] = do ->
        if ( Transform = Transforms[ field.type ])?
          Transform.normalize field, data[ field.name ]
        else data[ field.name ]
    expand result

export { normalize }