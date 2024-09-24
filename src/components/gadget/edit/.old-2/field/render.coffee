import Generic from "@dashkite/generic"
import HTML from "@dashkite/html-render"
import Exemplars from "./exemplars"
import * as Templates from "./templates"

render = Generic.make "Field.render"

  # we tried to lookup the exemplar but we didn't anything
  .define [ String, undefined, Object ], ( key, specifier, { gadget }) ->
    console.warn "Field.render:
      missing field specifier for [ #{ key } ]
      for gadget type [ #{ gadget.type } ]"

  # we have a field specifier instead of just the key, which means
  # it's “custom” ... we can still try to fill defaults if a
  # corresponding exemplar exists for the key
  .define [ Object, Object ], ({ key, specifier... }, context ) ->
    if ( exemplar = Exemplars[ key ])?
      specifier = { exemplar..., specifier... }
    render key, specifier, context

  # we have a key and a context, so lookup the corresponding specifier
  .define [ String, Object ], ( key, context ) ->
    render key, Exemplars[ key ], context

  # this is the goal: to have the key, a field specifier, and the context
  .define [ String, Object, Object ], ( key, specifier, context ) ->
    template = Templates[ specifier.type ] ? Templates.basic
    template key, specifier, context

export { render }