import MiniSearch from "minisearch"
import * as K from "@dashkite/katana/async"
import { Gadgets } from "@dashkite/talisa"

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

normalize = K.poke ({ name, icon, text, hints }) ->
  { name, icon, text, size: hints.size }

denormalize = K.poke ({ name, icon, text, size }) ->
  { name, icon, text, hints: { size }}


export {
  search
  normalize
  denormalize
}