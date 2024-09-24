import Types from "./types"
import Exemplars from "./exemplars"

Render =

  make: ( type, specifier ) ->
    if Type.isObject specifier 

Transform =

  make: ( type, specifier ) ->






_Fields = {}
for type, specifier of Types
  _Fields[ type ] = if Type.isObject specifier
    
    render: Render.make type, specifier
    transform: Transform.make type, specifier
  if Type.isObject specifier
  else

Fields =

  render: ({ gadget }) ->
    if ( field = _Fields[ gadget.type ])?
      field.render data, context
    else
      console.warn "Fields.render:
        unknown type [ #{ gadget.type } ] "

  transform: ( data, { gadget  })
    if ( field = _Fields[ gadget.type ])?
      field.transform
    else
      console.warn "Fields.render:
        unknown type [ #{ gadget.type } ] "

  normalize: ( data, context ) ->
    if ( transform = Fields.transform data, context )?
      transform.normalize data, context

  denormalize: ( data, context ) ->
    if ( transform = Fields.transform data, context )?
      transform.denormalize data, context

