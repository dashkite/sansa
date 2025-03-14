import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"

import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import * as Ks from "@dashkite/katana/sync"
# import HTTP from "@dashkite/rio-vega"

import { Gadgets } from "@dashkite/talisa"

import Site from "#helpers/site"

import html from "./html"

Editor =


  # update a gadget from the editor
  initialize: Rio.input "[slot='editor']", [
    Montrose.update "site", [
      K.peek ( data, { detail }) ->
        { selected, gadgets } = data
        target = gadgets.get selected
        Object.assign target, detail      
    ]
  ]
      
export { Editor }
