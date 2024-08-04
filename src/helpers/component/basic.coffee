import * as Fn from "@dashkite/joy/function"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

Basic =

  form: ( css ) ->
    css = if Array.isArray css then css else [ css ]

    Fn.pipe [

      Rio.shadow
      
      Rio.sheets [
        css...
        Posh.component
        Posh.forms
        Posh.animations
        Posh.icons
      ]

    ]


export default Basic
export { Basic }