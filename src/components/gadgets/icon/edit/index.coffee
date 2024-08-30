import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"

import Basic from "#helpers/component/basic"
import Gadget from "#helpers/component/gadget"

import { reset, normalize, denormalize } from "./helpers"
import Icons from "./icons"

import html from "./html"
import css from "./css"

class extends Rio.Handle
  Meta.mixin @, [
    Rio.tag "sansa-edit-icon"

    Rio.diff

    Rio.initialize [

      Basic.form css

      Gadget.input [ normalize ]

      # reset search form on change events
      Gadget.change [ reset, normalize ]

      Gadget.activate [ denormalize, Rio.render html ]

    ]

    Gadget.connect [ denormalize, Rio.render html ]

  ]
