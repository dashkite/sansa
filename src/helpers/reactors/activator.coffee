activator = ( reactor ) ->

  active = false

  for await event from reactor
    switch event.name
      when "modified"
        if active
          yield name: "reset"
        yield event
      when "activate"
        if !active
          active = true
          yield event
      when "deactivate"
        active = false
        yield event
      else
        yield event

export { activator }
