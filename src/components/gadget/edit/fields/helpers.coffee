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

export {
  expand
  collapse
}