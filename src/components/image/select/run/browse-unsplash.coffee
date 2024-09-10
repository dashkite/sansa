import * as Fn from "@dashkite/joy/function"
import Registry from "@dashkite/helium"
import { Gadget } from "@dashkite/talisa"
import MiniSearch from "minisearch"
import * as Format from "@dashkite/rio-arriba/format"

# TODO temporary: move into an API later
import * as Unsplash from "unsplash-js"
unsplash = Unsplash.createApi
  accessKey: "2FYUlCW40XCGpAeDIAqzcSRmn6nCacDD-8StgGRbRb8"

search = ( term ) ->
  if term.length >= 3
    { response, type } = await unsplash.search.getPhotos query: term
    if type == "success"
      results = response
        .results
        .map ( result ) ->
          name: result.alt_description
          image: url: result.urls.small
    else undefined

browseUnsplash = ( talos, { name, context: { term }}) ->
  results = if term? then await search term
  talos.context.state.update Fn.tee ( state ) ->
    state.name = name
    state.title = Format.title name
    state.term = term
    state.results = results

export { browseUnsplash }