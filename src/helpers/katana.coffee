import * as K from "@dashkite/katana/async"

tag = ( key ) -> K.poke ( value ) -> [ key ]: value

export default { tag }
