import Channel from "@dashkite/reactive/channel"

toggle = ( reactor ) ->

  channel = Channel.make()

  do =>
    for await event from reactor
      switch event.name
        when "activate", "reset"
          channel.source await @activate()
        when "deactivate"
          @deactivate()
        else
          channel.send event

  channel
  
export { toggle }