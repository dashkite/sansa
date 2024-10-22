import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as K from "@dashkite/katana"
import * as Rio from "@dashkite/rio"
import Gadget from "./gadget"
import Data from "./data"
import html from "./html"

Form = 

  update: Fn.flow [
    Gadget.get
    Rio.form
    K.peek ( data ) -> form: data
    Data.normalize
    Gadget.update   
  ]

  render: Fn.flow [
    Gadget.get
    K.push Obj.get "data"
    Data.denormalize
    K.mpoke ( data, gadget, state ) -> { data, gadget, state }
    Rio.render html
  ]

export default Form