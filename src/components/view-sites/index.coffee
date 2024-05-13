import * as Fn from "@dashkite/joy/function"
import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana"
import * as Rio from "@dashkite/rio"
import { Error, Form } from "@dashkite/rio-forms"
import * as Posh from "@dashkite/posh"

import Profile from "#helpers/profile"

import html from "./html"
import css from "./css"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-view-sites"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      Rio.sheets [ css, Posh.component ]

      # TODO Rio.describe for resource binding

      Rio.activate [
        K.push Profile.get
        Rio.render html
      ]
    ]
  ]
