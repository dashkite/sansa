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

    Rio.tag "sansa-connect"
    Rio.diff

    Rio.initialize [

      Rio.shadow
      Rio.sheets [ css, Posh.component, Posh.forms ]

      Rio.activate [
        Rio.render html
        Rio.focus "input"
      ]

      Rio.submit [
        K.poke Profile.save
        Rio.dispatch "success"
      ]

      Rio.invalid [
        Error.capture
        Rio.form
        Form.prefill
        Rio.render html
      ]

      Rio.change "form [name]", [
        Error.dismiss
        Rio.form
        Form.prefill
        Rio.render html
      ]
    ]
  ]
