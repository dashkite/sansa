import * as Rio from "@dashkite/rio"
import Registry from "@dashkite/rio-helium"
import Observable from "@dashkite/rio-observable"
import Form from "./form"


import * as K from "@dashkite/katana/async"

events = Rio.initialize [

  Rio.input "form", [
    Registry.get "https://application/state"
    Observable.update [ Form.update ]
  ]

  Rio.change "form", [
    Registry.get "https://application/state"
    Observable.update [ Form.update ]
  ]

  Rio.activate [
    Registry.get "https://application/state"
    Observable.get
    Form.render
  ]

]

export { events }