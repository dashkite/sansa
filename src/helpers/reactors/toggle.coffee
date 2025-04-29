import Channel from "@dashkite/reactive/channel"

toggle = ( reactor ) ->

  channel = Channel.make()
  visible = false

  do =>
    for await event from reactor
      switch event.name
        when "show", "modified"
          if !visible
            visible = true
            channel.source await @show()
        when "hide"
          if visible
            visible = false
            @hide()
        else
          channel.send event

  channel
  
export { toggle }