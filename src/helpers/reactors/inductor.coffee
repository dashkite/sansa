inductor = ( reactor ) ->

  active = false
  deactivating = false
  
  for await event from reactor
    switch event.name
      when "activate"
        deactivating = false
        if !active
          active = true
          yield event
      when "deactivate"
        do ->
          deactivating = true
          await Time.sleep 100
          if deactivating
            active = false
            deactivating = false
            yield event
      else
        yield event

export { inductor }