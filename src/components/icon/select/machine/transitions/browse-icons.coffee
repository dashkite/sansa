import data from "./data"
import MiniSearch from "minisearch"
import * as Format from "@dashkite/rio-arriba/format"

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

run = ( talos, { name, context: { term }}) ->
  results = if term? then search term
  title = Format.title name
  talos.context.state.plan ( state ) ->
    Object.assign state, { name, title, term, results }

export { run }