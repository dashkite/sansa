forType = ( type ) ->
  ( specifier ) -> specifier.type == type

forImage = forType "image"
forPage = forType "page"
forEnumerable = forType "enumerable"

export {
  forImage
  forPage
  forEnumerable
}