import * as Text from "@dashkite/joy/text"
import Import from "#helpers/import"

Templates =

  templates: {}

  load: ->
    # import these explicitly even though we're using
    # dynamic imports to allow atlas to build the import map
    # see also: https://github.com/evanw/esbuild/issues/700
    @templates = await Import.resolve
      "browse gadgets": import( "./browse-gadgets" )
      "browse unsplash": import( "./browse-unsplash" )
      "home": import( "./home" )
      "provide url": import( "./provide-url" )
      "uploading file": import( "./uploading-file" )

    # aliases
    @templates.connect = @templates.home
    @templates

  get: ( name ) -> @templates[ name ]

  apply: ( name, self, args ) ->
    t = Templates.get name
    t.apply self, args

export default Templates