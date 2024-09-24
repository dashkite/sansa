import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"
import css from "./css"

initialize = Rio.initialize [

  Rio.shadow
  
  Rio.sheets [
    css
    Posh.component
    Posh.forms
    Posh.animations
    Posh.icons
  ]

]

export { initialize }