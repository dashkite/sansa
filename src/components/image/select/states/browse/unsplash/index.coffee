import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import { icon } from "#helpers/icons"

# TODO temporary: move into an API later
import * as Unsplash from "unsplash-js"
unsplash = Unsplash.createApi
  accessKey: "2FYUlCW40XCGpAeDIAqzcSRmn6nCacDD-8StgGRbRb8"

search = ( term ) ->
  { response, type } = await unsplash.search.getPhotos query: term
  if type == "success"
    results = response
      .results
      .map ( result ) ->
        name: result.alt_description
        image: url: result.urls.small
  else undefined

States =

  "browse-unsplash": 

    render: ({ state: { term, results }}) ->
      state = if ( results? && ( results.length > 1  ))
        "open"
      else "closed"
      [
        
        Render.field
          label: "Search"
          hint: "Search Unsplash Images"
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
