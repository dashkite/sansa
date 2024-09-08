import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import { icon } from "#helpers/icons"
import Registry from "@dashkite/helium"
import { Gadget } from "@dashkite/talisa"
import MiniSearch from "minisearch"

# TODO we don't really need to do this every time
#      but we'd need to add search to the state
#      module so we know something has changed 

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
  observable = await Registry.get "sansa.editor.state"
  { gadgets } = observable.get()
  images = gadgets.filter Gadget.withTypes [ "image", "variant" ]
  index = createIndex images
  index.search term, prefix: true, fuzzy: true

find = ( term, results ) ->
  results.find ( result ) -> term == result.name

match = ( term, results ) ->
  ( find term, results )?



States =

  "browse-gadgets": 

    render: ({ state: { term, results }}) ->
      state = if ( results? && ( results.length > 1  ))
        "open"
      else "closed"
      [
        Render.field
          label: "Search"
          hint: "Search the Image Gadgets"
          name: "term"
          type: "custom"
          required: true
          html: HTML.tag "vellum-autocomplete",
            name: "term"
            value: term
            data: { state }
            if results?
              for result in results
                HTML.div slot: "option", data: value: result.image.url, [
                  HTML.img src: result.image.url
                  HTML.span result.name
                ]
      ]
    
    links:

      "search": ({ state, handle }) ->
        input = handle.root.querySelector "vellum-autocomplete[name='term']"
        term = input.value
        if term.length >= 3
          results = await search term
          { state..., term, results }
        else
          state

      "done": ({ state, handle }) ->
        target = handle.root.querySelector "[name='term']"
        handle.dispatch "change", image: url: target.value
        name: "start"
        back: state


export default States
