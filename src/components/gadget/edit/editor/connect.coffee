import * as Fn from "@dashkite/joy/function"
import * as Rio from "@dashkite/rio"
import Registry from "@dashkite/rio-helium"
import Observable from "@dashkite/rio-observable"
import Form from "./form"

connect = Fn.pipe [

  Rio.connect [
    Fn.flow [
      Registry.get "sansa.editor.state"
      Observable.observe [ Form.render ]
    ]
  ]

  Rio.disconnect [
    Fn.flow [
      Registry.get "sansa.editor.state"
      Observable.cancel
    ]
  ]
        
]

export { connect }
