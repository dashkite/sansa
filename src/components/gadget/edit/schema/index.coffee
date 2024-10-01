import * as Type from "@dashkite/joy/type"
import Types from "./types"
import Exemplars from "./exemplars"

schema = ( data ) ->
  specifier = []
  if ( fields = Types[ data.type ])?
    for field in fields
      do ({ exemplar } = {}) ->
        field = if Type.isObject field then field else name: field
        exemplar = Exemplars[ field.name ]
        specifier.push {
          type: "text"
          exemplar...
          field...
        }
  else
    console.warn "sansa-edit-gadget: schema: 
      unknown type [ #{ data.type } ]"
  specifier

export default schema