import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"

import Gadget from "#helpers/component/gadget"

import { normalize, denormalize } from "./helpers"
import html from "./html"
import css from "./css"

class extends Rio.Handle
  Meta.mixin @, [
    Rio.tag "sansa-edit-icon"
    Gadget.editor { normalize, denormalize, html, css }
  ]
