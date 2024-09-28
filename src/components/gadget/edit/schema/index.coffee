import * as Type from "@dashkite/joy/type"
import * as Obj from "@dashkite/joy/object"
import Generic from "@dashkite/generic"
import Types from "./types"
import Exemplars from "./exemplars"

warn = ( message ) ->
  console.warn "sansa-edit-gadget: schema: #{ message }"

schema = Generic.make "schema"

  .define [ Obj.has "type" ], ( data ) ->
    specifier = []
    if ( fields = Types[ data.type ])?
      for field in fields
        field = if Type.isObject field
          field
        else 
          name: field
        if ( exemplar = Exemplars[ field.name ])?
          specifier.push { exemplar..., field... }
        else
          warn "no exemplar for field [ #{ field.name } ]"
          specifier.push { field..., type: "text" }
    else
      warn "unknown type [ #{ data.type } ]"
    specifier

export default schema