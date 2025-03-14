import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import Observable from "@dashkite/rio-observable"

import configuration from "#configuration"
{ origin } = configuration

template = "local:/components/sansa-edit-site/{ site }"

edit = ( field ) -> 
  K.peek ( state ) -> state.editing = field

Site =

  "update attributes": Rio.initialize [
    Rio.modify [ "data-site" ], [ 
      K.push Obj.getx "dom.dataset.data.site"
      K.peek Montrose.resource { name: "site", origin, type: Gadgets }
      K.peek Montrose.resource { name: "state", template }
      K.peek Montrose.observe [ "site", "state" ], [
        Rio.render html
      ]
    ]
  ]

  "start inline editing": Fn.pipe [
    # edit title
    Rio.click "header h1", [
      Registry.get "https://application/state"
      Observable.update [ edit "title" ]
    ]

    # edit description
    Rio.click "header p", [
      Registry.get "https://application/state"
      Observable.update [ edit "description" ]
    ]
  ]

  "inline editing": Rio.change "header input", [
    Registry.get "https://application/state"
    Observable.update [
      K.peek ( state, event ) ->
        { name, value } = event.target
        state.site[ name ] = value
    ]
  ]

  "stop editing": Rio.focusout "header", [
    Registry.get "https://application/state"
    Observable.update [
      K.peek ( state ) -> delete state.editing
    ]
  ]

  "exit input": Rio.keyup "header input", [
    K.peek ( event ) ->
      switch event.code
        when "Enter", "Escape"
          event.target.blur()
  ]

  "change mode": Rio.change "header sansa-select-mode", [
    K.poke ( event ) -> event.target.value
    Registry.get "https://application/state"
    Observable.update [
      K.peek ( state, value ) -> state.mode = value
    ]
  ]

Site[ "inline editing" ] = Fn.pipe [
  Site[ "start inline editing" ]
  Site[ "inline editing" ]
  Site[ "stop editing" ]
  Site[ "exit input"]
]

Site.events = Fn.pipe [
  Site[ "inline editing" ]
  Site[ "change mode" ]
]

export { Site }
