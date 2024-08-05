import MiniSearch from "minisearch"
import * as K from "@dashkite/katana/async"
import { Gadgets } from "@dashkite/talisa"
import * as Format from "@dashkite/rio-arriba/format"

import icons from "./icons"

documents  = []
id = 0
for category, dictionary of icons
  for name, keywords of dictionary
    documents.push { id, name, category, keywords }
    id += 1

index = new MiniSearch
  fields: [ "name", "category", "keywords" ]
  storeFields: [ "name" ]

index.addAll documents

search = ( term ) -> 
  index.search term, prefix: true, fuzzy: 0.2

normalize = K.poke ({ name, style, icon, text, hints }) ->
  icon = Format.dashed icon if icon?
  { name, style, icon, text, size: hints?.size }

denormalize = K.poke ({ name, style, icon, text, size }) ->
  options = if icon?.length >= 3 then ( search icon )[0..10] else []
  icon = Format.title icon if icon?
  { name, style, icon, options, text, hints: { size }}


export {
  search
  normalize
  denormalize
}