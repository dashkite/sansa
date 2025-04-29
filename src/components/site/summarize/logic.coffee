import Registry from "@dashkite/registry"
import pending from "#templates/pending"
import html from "./html"

logic = ( reactor ) ->

  application = await Registry.get "application"

  decorate = ( value ) ->
    value.links =
      edit: application.link
        name: "edit site"
        bindings: 
          site: value.site.address
      remove: application.link
        name: "remove site"
        bindings: 
          site: value.site.address
    value
  
  for await event from reactor

    switch event.name

      when "connect"
        @render pending

      when "value"
        if event.value.site?
          @render html, decorate event.value

      else yield event

  return

export default logic