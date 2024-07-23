import * as Arr from "@dashkite/joy/array"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
# import { Observable } from "@gullerya/object-observer"

class Observable

  @from: ( data ) ->
    Object.assign ( new @ ), { data, handlers: [] }

  get: ->
    structuredClone @data

  update: ( mutator ) ->
    @data = await mutator structuredClone @data
    data = structuredClone @data
    for handler in @handlers
      handler data

  observe: ( handler ) ->
    @handlers.push handler
    handler

  cancel: ( handler ) ->
    @handlers = Arr.remove handler, @handlers

observe = generic name: "observe"

generic observe,
  Type.isDefined,
  ( value ) -> Observable.from value

generic observe,
  ( Type.isKind Observable ),
  Type.isFunction,
  ( observable, handler ) -> observable.observe handler

export default observe