import data from "./data"
import MiniSearch from "minisearch"

documents  = []
id = 0
for category, dictionary of data
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

match = ( term ) -> ( find term )?

export {
  search
  find
  match
}