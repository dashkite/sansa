import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import Gadget from "#helpers/component/gadget"

import { normalize, denormalize } from "./helpers"
import html from "./html"
import css from "./css"

class extends Rio.Handle
  Meta.mixin @, [
    Rio.tag "sansa-edit-link"
    Gadget.editor { 
      normalize, denormalize, html, 
      css: [ css, Posh.compact ]
    }
  ]
