timeline = ( reactor ) ->

  states = []
  current = -1
  forward = false
  back = false

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
        states = []
        current = -1
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
        states = push state 
        yield decorate state

    console.log { states, current }

export { timeline }