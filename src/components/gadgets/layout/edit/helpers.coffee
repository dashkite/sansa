import * as Text from "@dashkite/joy/text"
import * as K from "@dashkite/katana/async"

# TODO these should probably come from Talisa
#      ( same with Proximity etc in the HTML template)

Layout = [
  "flow"
  "grid"
  "preset"
]

Width = [
  "narrowest"
  "narrower"
  "narrow"
  "auto"
  "wide"
  "wider"
  "widest"
]

Proximity = [
  "coziest"
  "cozier"
  "cozy"
  "auto"
  "roomy"
  "roomier"
  "roomiest"
]

Size = [
  "smallest"
  "smaller"
  "small"
  "auto"
  "large"
  "larger"
  "largest"
]

Alignment = [
  "start"
  "center"
  "end"
  "stretch"
]

Justification = [
  "start"
  "center"
  "end"
  "between"
  "around"
  "evenly"
]

Orientation = [
  "horizontal"
  "vertical"
]

normalize = K.poke ( data ) ->
  name: data.name
  subtype: data.subtype
  hints:
    alignment: data.alignment
    justification: data.justification
    orientation: data.orientation
    proximity: Proximity[ Text.parseNumber data.proximity ]
    size: Size[ Text.parseNumber data.size ]
    width: Width[ Text.parseNumber data.width ]
    wrap: ( data.wrap == "on" )


denormalize = K.poke ({ name, subtype, hints }) ->
  { alignment, justification, orientation, 
    proximity, size, width, wrap } = hints
  {
    name, subtype
    alignment, justification, orientation, wrap
    proximity: Proximity.indexOf proximity
    size: Size.indexOf size
    width: Width.indexOf width
  }

export {
  Layout
  Width
  Proximity
  Size
  Alignment
  Justification
  Orientation
  normalize
  denormalize
}