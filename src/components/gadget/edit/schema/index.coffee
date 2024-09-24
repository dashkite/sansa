import Generic from "@dashkite/generic"
import Types from "./types"
import Exemplars from "./exemplars"

warn = ( message ) ->
  console.warn "sansa-edit-gadget: schema: #{ message }"

schema = Generic.make "schema"

  .define [ Object ], ( data ) ->
    specifier = []
    if ( fields = Types[ data.type ])?
      for field in fields
        field = if Type.isObject field then field else name: field
        if ( examplar = Exemplars[ field.name ])?
          specifier.push { exemplar..., field... }
        else
          warn "unknown field [ #{ field.name } ]"
    else
      warn "unknown type [ #{ data.type } ]"
    specifier

export default schema