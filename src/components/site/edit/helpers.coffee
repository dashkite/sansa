import * as K from "@dashkite/katana/async"

tag = ( key ) ->
  K.poke ( value ) -> [ key ]: value

parent = K.poke ( target ) -> target.parentNode

key = K.poke ( target ) -> target.dataset.key

warn = K.peek ( error ) -> console.warn { error }

log = ( key ) ->
  K.peek ( value ) -> console.log [ key ]: value 

export default {
  tag
  parent
  key
  warn
  log
}