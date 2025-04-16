resolution = ( reactor ) ->

  listening = false
  closing = false
  
  for await event from reactor
    switch event.name
      when "listen"
        closing = false
        if !listening
          listening = true
          yield name: "resolve"
          yield name: "listen"
      when "close"
        do ->
          closing = true
          await Time.sleep 100
          if closing
            listening = false
            closing = false
            yield name: "close"
      else
        yield event

export { resolution }