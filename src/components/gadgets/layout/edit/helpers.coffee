import * as K from "@dashkite/katana/async"
import { Gadgets } from "@dashkite/talisa"

# TODO these should probably come from Talisa
#      ( same with Proximity etc in the HTML template)

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
  hints:
    alignment: data.alignment
    justification: data.justification
    orientation: data.orientation
    proximity: Proximity[ data.proximity ]
    width: Width[ data.width ]
    wrap: ( data.wrap == "on" )


denormalize = K.poke ({ name, hints }) ->
  { alignment, justification, orientation, 
    proximity, width, wrap } = hints
  {
    name
    alignment, justification, orientation, wrap
    proximity: ( Proximity.indexOf proximity )
    width: ( Width.indexOf width )
  }

export {
  Width
  Proximity
  Alignment
  Justification
  Orientation
  normalize
  denormalize
}