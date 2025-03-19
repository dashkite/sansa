import * as Meta from "@dashkite/joy/metaclass"

Registry = {}

Templates =

  get: ( key ) ->

    Registry[ key ] ?= {

      registry: {}

      add: ( name, template ) -> 
        @registry[ name ] = template
        @

    }

  mixin: ( T ) ->
    T.templates = ( Templates.get T.tag ).registry
    Meta.getters T::,
      templates: -> @constructor.templates

mixin = Templates.mixin

export { mixin }
export default Templates