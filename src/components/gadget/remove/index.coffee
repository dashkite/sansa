import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import State from "#helpers/state"

import html from "./html"
import css from "./css"

# TODO move into helpers
# TODO if !selected?
#      this happens incidentally when disconnecting
#      b/c we attempt to render before the top-level editor
#      so the disconnect handler hasn't fired
#      BUT! could it happen otherwise?
import * as K from "@dashkite/katana/async"
import { Gadgets } from "@dashkite/talisa"
gadget = K.poke ({ gadgets, selected }) ->
  if selected? then gadgets.get selected

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-remove-gadget"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      
      Rio.sheets [ 
        css
        Posh.component
        Posh.forms
        Posh.animations
        Posh.icons
      ]

      Rio.describe [
        State.load
        gadget
        Rio.render html
      ]
  
      Rio.click "[name='remove']", [
        State.update [
          K.peek ( state ) ->
            Gadgets.remove state.selected, state.gadgets
            delete state.selected
            delete state.editor

        ]
      ]

      Rio.click "[href='#cancel']", [
        State.pop
      ]
    ]



  ]