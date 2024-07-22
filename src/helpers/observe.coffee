import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import { Observable } from "@gullerya/object-observer"


isObservable = ( value ) -> Observable.isObservable value

observe = generic name: "observe"

generic observe,
  Type.isDefined,
  ( value ) -> Observable.from value

generic observe,
  isObservable,
  Type.isFunction,
  ( observable, handler ) ->
    Observable.observe observable, handler

export default observe