import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"

tag = ( key ) ->
  K.poke ( value ) -> [ key ]: value

unset = ( key ) ->
  K.poke ( value ) -> 
    value[ key ] = undefined
    value

parent = K.poke ( target ) -> target.parentNode

key = K.poke ( target ) -> target.dataset.key

warn = K.peek ( error ) -> console.warn { error }

log = ( key ) ->
  K.peek ( value ) -> console.log [ key ]: value 

# TODO maybe there's more elegant way to do this?

focus = Fn.flow [
  K.read "handle"
  K.peek ( handle ) ->
    handle
      .root
      .querySelectorAll "input"
      .values()
      .find ( input ) -> input.checkVisibility()
      ?.focus()
]

export default {
  tag
  unset
  parent
  key
  warn
  log
  focus
}