import * as Meta from "@dashkite/joy/metaclass"

getters = ( T, dictionary ) -> Meta.getters dictionary, T::

Registry = 

  make: ->

    registry = {}

    {

      add: ( name, template ) -> 
        registry[ name ] = template
        @

    mixin: ( T ) ->
      T.templates = registry
      getters T, templates: -> registry

    }



export default Registry