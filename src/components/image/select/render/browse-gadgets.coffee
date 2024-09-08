import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

browseGadgets = ( state ) ->

  state = if ( state.results? && ( state.results.length > 1  ))
    "open"
  else "closed"

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

export { browseGadgets }
