import * as Meta from "@dashkite/joy/metaclass"

Registry = 

  make: ->

    registry = {}

    {

      add: ( name, template ) -> 
        registry[ name ] = template
        @

      get: ( name ) -> registry[ name ]

    }

export default Registry