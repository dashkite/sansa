activation = ( reactor ) ->

  active = false

  for await event from reactor
    switch event.name
      when "modified"
        yield name: "close"
        yield name: "listen" if active
      when "activate"
        if !active
          active = true
          yield name: "listen"
      when "deactivate"
        active = false
        yield name: "close"
      else
        yield event

export { activation }
