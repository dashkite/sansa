import Channel from "@dashkite/reactive/channel"

toggle = ( reactor ) ->

  channel = Channel.make()

  do =>
    for await event from reactor
      switch event.name
        when "show", "modified"
          channel.source await @show()
        when "hide"
          @hide()
        else
          channel.send event

  channel
  
export { toggle }