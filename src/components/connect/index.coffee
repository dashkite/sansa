import * as Fn from "@dashkite/joy/function"
import * as Meta from "@dashkite/joy/metaclass"
import * as K from "@dashkite/katana"
import * as Posh from "@dashkite/posh"

import * as Rio from "@dashkite/rio"
import Profile from "@dashkite/rio-profile"
import * as Arriba from "@dashkite/rio-arriba"

import html from "./html"
import css from "./css"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-connect"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      Rio.sheets [ css, Posh.component, Posh.forms ]

      Rio.submit [
        K.peek ( profile ) -> profile.sites ?= []
        Profile.save
        Rio.dispatch "success"
      ]

      Arriba.validate html

    ]
  ]
