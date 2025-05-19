import { eventful } from "@dashkite/wayland"

import $ from "./selectors"

events = ( base ) ->

  class extends eventful base

    @click()
      .within $[ "browse file button"]
      .send "browse files"

    @click()
      .within $[ "other buttons" ]
      .send "button action"

    @change()
      .matches $[ "file input" ]
      .send "upload file"

    @listen "search"
      .matches $[ "search gadgets" ]
      .send "search gadget"
    
    @change()
      .matches $[ "search gadgets" ]
      .send "select gadget"

    @listen "search"
      .matches $[ "unsplash autocomplete" ]
      .send "search unsplash"
    
    @change()
      .matches $[ "unsplash field" ]
      .send "select unsplash"

    @change()
      .matches $[ "url input" ]
      .send "update url"

export default events