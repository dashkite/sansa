import * as Fn from "@dashkite/joy/function"
import Registry from "@dashkite/helium"
import { Gadget } from "@dashkite/talisa"
import MiniSearch from "minisearch"
import Format from "@dashkite/format-text"

# TODO we don't really need to do this every time

createIndex = ( images ) ->
  index = new MiniSearch
    fields: [ "name" ]
    storeFields: [ "name", "image" ]
  documents  = []
  id = 0
  for { name, image } in images
    documents.push { id, name, image }
    id += 1
  index.addAll documents
  index

search = ( term ) ->
  if term.length >= 3
    observable = await Registry.get "sansa.editor.state"
    { gadgets } = observable.get()
    images = gadgets
      .filter Gadget.withTypes [ "image", "variant" ]
      .map ( key ) -> gadgets.get key
    index = createIndex images
    index.search term, prefix: true, fuzzy: true

find = ( term, results ) ->
  results.find ( result ) -> term == result.name

match = ( term, results ) ->
  ( find term, results )?

run = ( talos, { name, context: { term }}) ->
  results = if term? then await search term
  title = Format.title name
  talos.context.state.plan ( state ) ->
    Object.assign state, { name, title, term, results }

export { run }