Registry = {}

Events =

  mixin: ( T ) -> ( Events.get T.tag ).mixin T

  get: ( key ) ->

    Registry[ key ] ?= {

      registry: []

      add: ( listener ) -> 
        @registry.push listener
        @

      mixin: ( T ) -> T.mixins @registry

    }

mixin = Events.mixin

export { mixin }
export default Events