import * as Obj from "@dashkite/joy/object"
import * as Type from "@dashkite/joy/type"
import { Gadget } from "@dashkite/talisa"

import { expand, collapse } from "./helpers"
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

  "hints.device":
    render: Render.Hints.device
    transform: Transforms.index Gadget.enumerated.device

  "hints.justification":
    render: Render.Hints.justification

  "hints.mode":
    transform: Transforms.index Gadget.enumerated.mode
    render: Render.Hints.mode

  "hints.orientation": 
    render: Render.Hints.orientation
  
  "hints.proximity":
    transform: Transforms.index Gadget.enumerated.proximity
    render: Render.Hints.proximity

  "hints.resolution":
    transform: Transforms.index Gadget.enumerated.resolution
    render: Render.Hints.resolution

  "hints.size":
    transform: Transforms.index Gadget.enumerated.size
    render: Render.Hints.size

  "hints.width":
    transform: Transforms.index Gadget.enumerated.width
    render: Render.Hints.width

  "hints.wrap": 
    transform: Transforms.boolean
    render: Render.Hints.wrap

export default Fields