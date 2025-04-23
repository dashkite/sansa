show = ( reactor ) ->

  visible = false
  modified = false

  for await event from reactor
    switch event.name
      when "modified"
        if visible
          yield event
        else
          modified = true
      when "show"
        if !visible
          visible = true
          if modified
            yield name: "modified"
            modified = false
          yield event
      when "hide"
        if visible
          visible = false
          yield event
      else
        yield event

export { show }
