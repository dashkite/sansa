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
  index.search term, prefix: true, fuzzy: true

find = ( term ) ->
  documents.find ({ name }) -> term == name

contains = ( term ) -> ( find term )?

normalize = K.poke ({ name, style, icon, text, hints }) ->
  icon = Format.dashed icon if icon?
  { name, style, icon, text, size: hints?.size }

denormalize = K.poke ({ name, style, icon, text, size }) ->
  if icon?
    if contains icon
      display = icon
    else if ( icon?.length >= 3 )
      options = search icon
      if options.length > 1
        options = options[..10]
      else
        options = undefined
    icon = Format.title icon
  { name, style, icon, display, options, text, hints: { size }}


export {
  normalize
  denormalize
}