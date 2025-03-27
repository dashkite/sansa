Registry =

  make: ->

    registry = []

    {

      add: ( listener ) -> 
        registry.push listener
        @

      mixin: ( T ) -> T.mixins registry

    }

export default Registry