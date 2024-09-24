import * as Type from "@dashkite/joy/type"

expand = ( data ) ->
  result = {}
  for key, value of data
    [ keys..., last ] = key.split "."
    current = result
    for subkey in keys
      current = ( current[ subkey ] ?= {} )
    current[ last ] = value
  result

collapse = ( data, prefix ) ->
  result = {}
  for key, value of data
    if Type.isObject value
      result = { result..., ( collapse value, key )... }
    else if prefix?
      result[ "#{ prefix }.#{ key }" ] = value
    else result[ key ] = value
  result

normalize = ( data ) ->
  result = {} 
  for key, value of data
    result[ key ] = Field.normalize key, value
  # expand back into a possibly nested object
  # and discard the form state
  { data..., _ } = expand result
  data

denormalize = ( gadget ) ->
  result = {}
  data = collapse gadget.data
  for key, value of data
    result[ key ] = Field.denormalize key, value
  result

export { normalize, denormalize }