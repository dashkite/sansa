inductor = ( specifier ) ->

  ( reactor ) ->

    inactive = false
    activating = false
    
    for await event from reactor
      switch event.name
        when specifier.on
          activating = false
          if !inactive
            inactive = true
            yield event
        when specifier.off
          do ->
            activating = true
            await Time.sleep specifier.wait
            if activating
              inactive = false
              activating = false
              yield event
        else
          yield event

export { inductor }