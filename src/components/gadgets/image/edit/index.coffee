import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana"

import Gadget from "#helpers/component/gadget"
import State from "#helpers/state"

import { normalize, denormalize, find } from "./helpers"
import html from "./html"
import css from "./css"

class extends Rio.Handle
  Meta.mixin @, [
    Rio.tag "sansa-edit-image"
    Gadget.editor { normalize, denormalize, html, css }

    # Rio.initialize [
    #   Rio.change "sansa-select-image", [
    #     State.update [
    #       Rio.description
    #       K.poke find
    #       K.pop ( gadget, state, event ) ->
    #         Object.assign gadget, event.detail
    #     ]
    #   ]
    # ]
  ]
