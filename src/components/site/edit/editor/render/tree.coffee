import Generic from "@dashkite/generic"
import * as Type  from "@dashkite/joy/type"
import * as Obj from "@dashkite/joy/object"
import * as Pred from "@dashkite/joy/predicate"
import HTML from "@dashkite/html-render"
import { Gadget, Atom, Mixin, Container } from "@dashkite/talisa"

import icon from "#helpers/icons"

isContainer = ({ content }) -> Type.isArray content

hasContent = ({ content }) ->
  ( Type.isArray content ) && ( content.length > 0 )

Attributes =

  make: ({ selected }, { key }) ->
    class:
      if selected == key
        "selected node"
      else "node"
    tabindex: "0"
    data: { key }

Render =

  input: ({ name }) ->
    HTML.input 
      name: "name"
      type: "text"
      value: name

  label: ({ renaming }, gadget ) ->
    category = gadget.constructor.name.toLowerCase()      
    HTML.label class: category, draggable: "true", [
      icon gadget.type
      if renaming == gadget.key
        Render.input { name: gadget.name }
      else
        HTML.span gadget.name
    ]
  
subtree = ( context, gadget ) ->
  result = []
  if gadget.mixins?
    for key in Object.values gadget.mixins
      result.push node context, key
  if gadget.content?
    for key in gadget.content
      result.push node context, key
  result

tree = ( context ) ->
  { gadgets } = context
  for gadget in gadgets.filter Gadget.isRoot
    node context, gadget

contentZones = ( gadget ) ->
  do ({ parent, index } = {}) ->
    parent = gadget.parent
    if parent?
      index = parent.content.indexOf gadget.key
      if index == 0
        before:
          key: parent.key
          index: index - 1
        after:
          key: parent.key
          index: index + 1  
      else
        after:
          key: parent.key
          index: index + 1  


node = Generic.make "node"

  .define [ Object, Atom ], ( context, gadget ) ->
    zones = contentZones gadget
    HTML.div ( Attributes.make context, gadget ), [
      HTML.div class: "zone", data: zones?.before
      HTML.div [ Render.label context, gadget ]
      HTML.div class: "zone", data: zones?.after
    ]

  .define [ Object, Mixin ], ( context, gadget ) ->
    key = gadget.parent.key
    HTML.div ( Attributes.make context, gadget ), [
      HTML.div class: "zone", data: { key }
      HTML.div [ Render.label context, gadget ]
      HTML.div class: "zone", data: { key }
    ]

  .define [ Object, Container ], ( context, gadget ) ->
    zones = contentZones gadget
    HTML.div ( Attributes.make context, gadget ), [
      HTML.div class: "zone", data: zones?.before
      HTML.div class: "zone", data: key: gadget.key, [ 
        Render.label context, gadget 
      ]
      HTML.div class: "zone", data: zones?.after
    ]

  .define [ Object, hasContent ], ( context, gadget ) ->
    open = gadget.key in context.open
    zones = contentZones gadget
    HTML.div ( Attributes.make context, gadget ), [
      HTML.div class: "zone", data: zones?.before
      HTML.details { open }, [
        HTML.summary  class: "zone", data: key: gadget.key,
          [ Render.label context, gadget ]
        HTML.div subtree context, gadget
      ]
      HTML.div class: "zone", data: zones?.after
    ]

  .define [ Object, String ], ( context, key ) ->
    { gadgets } = context
    node context, gadgets.get key

export default tree
export { tree }