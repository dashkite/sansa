import * as Arr from "@dashkite/joy/array"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import { Gadgets } from "@dashkite/talisa"

wrap = ( state ) ->
  if state?.gadgets?
    { state..., gadgets: Gadgets.from state.gadgets }
  else state

unwrap = ( state ) ->
  { state..., gadgets: state?.gadgets?.data }

class Observable

  @keep: 10

  @from: ( data ) ->
    Object.assign ( new @ ), { data, handlers: [], history: [] }

  get: -> wrap structuredClone @data

  update: ( mutator ) ->
    do @push
    data = wrap structuredClone @data
    @data = unwrap await mutator data
    data = wrap structuredClone @data
    handler data for handler in @handlers
      
  observe: ( handler ) ->
    @handlers.push handler
    handler

  cancel: ( handler ) ->
    @handlers = Arr.remove handler, @handlers

  push: ->
    @history.push @data
    if @history.length > Observable.keep
      do @history.shift

  pop: ->
    @data = @history.pop()
    data = wrap structuredClone @data
    handler data for handler in @handlers
    data

observe = generic name: "observe"

generic observe,
  Type.isDefined,
  ( value ) -> Observable.from value

generic observe,
  ( Type.isKind Observable ),
  Type.isFunction,
  ( observable, handler ) -> observable.observe handler

export default observe