timeline = ( predicate = ( -> true )) ->

  ( reactor ) ->

    { states, current, forward, back } = {}

    reset = ->
      states = []
      current = -1

    refresh = ->
      forward = current < ( states.length - 1 )
      back = current > 0

    decorate = ( event ) ->
      refresh()
      Object.assign event, { forward, back }

    push = ( state ) ->
      if ( states[ current ]?.name != state.name )
        [ states[ 0...( ++current )]..., state ]
      else states

    for await state from reactor

      switch state.name

        when "start"
          reset()
          yield decorate state

        when "home"
          reset()
          states = push state 
          yield decorate state

        when "forward"
          if forward
            yield decorate states[ ++current ]
          else
            console.warn "no <forward> state available"

        when "back"
          if back
            yield decorate states[ --current ]
          else
            console.warn "no <back> state available"          

        else
          states = push state if predicate state
          yield decorate state

export { timeline }