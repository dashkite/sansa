import * as Fn from "@dashkite/joy/function"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import Observable from "@dashkite/rio-observable"
import Registry from "@dashkite/rio-helium"


edit = ( field ) -> 
  K.peek ( state ) -> state.editing = field

Site =

  "start inline editing": Fn.pipe [
    # edit title
    Rio.click "header h1", [
      Registry.get "sansa.editor.state"
      Observable.update [ edit "title" ]
    ]

    # edit description
    Rio.click "header p", [
      Registry.get "sansa.editor.state"
      Observable.update [ edit "description" ]
    ]
  ]

  change: Rio.change "header", [
    Registry.get "sansa.editor.state"
    Observable.update [
      K.peek ( state, event ) ->
        { name, value } = event.target
        state.site[ name ] = value
    ]
  ]

  "stop editing": Rio.focusout "header", [
    Registry.get "sansa.editor.state"
    Observable.update [
      K.peek ( state ) -> delete state.editing
    ]
  ]

  "exit input": Rio.keyup "header", [
    K.peek ( event ) ->
      switch event.code
        when "Enter", "Escape"
          event.target.blur()
  ]

Site[ "inline editing" ] = Fn.pipe [
  Site[ "start inline editing" ]
  Site.change
  Site[ "stop editing" ]
  Site[ "exit input"]
]

Site.initialize = Site[ "inline editing" ]

export { Site }
