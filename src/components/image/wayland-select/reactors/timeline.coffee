timeline = ( reactor ) ->

  states = []
  current = 0
  forward = false
  back = false

  refresh = ->
    forward = current < ( states.length - 1 )
    back = current != 0

  decorate = ( event ) ->
    refresh()
    Object.assign event, { forward, back }

  push = ( state ) ->
    [ states[ 0..( current++ )]..., state ]

  for await state from reactor

    switch state.name

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

export { timeline }