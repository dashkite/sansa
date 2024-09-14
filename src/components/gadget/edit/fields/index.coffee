import * as Obj from "@dashkite/joy/object"
import * as Type from "@dashkite/joy/type"

import { expand, collapse } from "./helpers"
import Enumerated from "./enumerated"
import Transforms from "./transforms"
import * as Render from "./render"

Field =

  normalize: ( key, value ) ->
    if ( specifier = Fields[ key ])? && ( specifier.transform? )
      specifier.transform.normalize value
    else value

  denormalize: ( key, value ) ->
    if ( specifier = Fields[ key ])? && ( specifier.transform? )
      specifier.transform.denormalize value
    else value

Fields =

  properties: [
    "type"
    "subtype"
    "name"
    "text"
    "description"
    "image"
    "icon"
    "hints"
  ]

  normalize: ( data ) ->
    result = {} 
    for key, value of data
      result[ key ] = Field.normalize key, value
    # expand back into a possibly nested object
    # and discard the form state
    { data..., _ } = expand result
    data

  denormalize: ( gadget ) ->
    result = {}
    data = collapse Obj.mask Fields.properties, gadget
    for key, value of data
      result[ key ] = Field.denormalize key, value
    result

  name:
    render: Render.name

  subtype:
    render: Render.subtype

  text:
    render: Render.text

  description:
    render: Render.description

  "image.url":
    render: Render.image
  
  icon:
    render: Render.icon

  "hints.alignment":
    render: Render.Hints.alignment

  "hints.justification":
    render: Render.Hints.justification

  "hints.orientation": 
    render: Render.Hints.orientation
  
  "hints.proximity":
    transform: Transforms.index Enumerated.proximity
    render: Render.Hints.proximity

  "hints.size":
    transform: Transforms.index Enumerated.size
    render: Render.Hints.size

  "hints.width":
    transform: Transforms.index Enumerated.width
    render: Render.Hints.width

  "hints.wrap": 
    transform: Transforms.boolean
    render: Render.Hints.wrap

export default Fields