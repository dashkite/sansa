import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as Posh from "@dashkite/posh"

import Profile from "@dashkite/rio-profile"

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
        Profile.load
        Rio.render html
      ]
    ]
  ]
