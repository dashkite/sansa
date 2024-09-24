import * as Rio from "@dashkite/rio"
import Registry from "@dashkite/rio-helium"
import Observable from "@dashkite/rio-observable"
import Form from "./form"

events = Rio.initialize [

  Rio.input "form", [
    Registry.get "sansa.editor.state"
    Observable.observe [ Form.update ]
  ]

  Rio.change "form", [
    Registry.get "sansa.editor.state"
    Observable.observe [ Form.update ]
  ]
  
  Rio.activate [
    Registry.get "sansa.editor.state"
    Observable.get
    Form.render
  ]

]

export { events }