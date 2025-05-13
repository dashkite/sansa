# basically, we pre-fetch these to help atlas/esbuild
import "./browse-gadgets"
import "./browse-unsplash"
import "./home"
import "./provide-url"
import "./uploading-file"

import Templates from "#helpers/templates"

templates = Templates.make ( name ) ->
  ( await import( "./#{ name }" ))
    .default 

templates.add [
  "browse-gadgets"
  "browse-unsplash"
  "home"
  "provide-url"
  "uploading-file"
]
  
export default templates