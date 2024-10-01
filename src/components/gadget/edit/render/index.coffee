import * as Fn from "@dashkite/joy/function"
import Generic from "@dashkite/generic"
import * as Templates from "./templates"
import schema from "../schema"

Transforms =

  link: ( field, gadget ) ->
    disabled = do ->
      switch field.name
        when "url" then !( gadget.subtype == "external" )
        when "page" then !( gadget.subtype == "internal" )
        else false
    { field..., disabled }

  layout: ( field, gadget ) ->
    disabled = do ->
      switch field.name
        when "hints.wrap" then !( gadget.subtype == "flow" )
        else false
    { field..., disabled }

render = ({ data, gadget }) ->
  for field in ( schema gadget )
    do ({ template, transform, value } = {}) ->
      template = Templates[ field.type ] ? Templates.basic
      transform = Transforms[ gadget.type ] ? Fn.identity
      field = transform field, gadget
      value = gadget[ field.name ]
      template field, value, data


export default render