import { generic } from "@dashkite/joy/generic"
import * as Type  from "@dashkite/joy/type"
import * as Obj from "@dashkite/joy/object"
import * as Pred from "@dashkite/joy/predicate"
import HTML from "@dashkite/html-render"
import { Gadget } from "@dashkite/talisa"

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
    data: { key }

Render =

  input: ({ name }) ->
    HTML.input 
      name: "name"
      type: "text"
      value: name

  label: ({ renaming }, { type, key, label, name }) ->
    name ?= "Untitled #{ type }"
    HTML.label draggable: "true", [
      icon type
      if renaming == key
        Render.input { name }
      else
        HTML.span name
    ]
  
subtree = ( context, content ) ->
  { gadgets } = context
  for key in content
    node context, gadgets.get key

tree = ( context ) ->
  { gadgets } = context
  for key in gadgets.filter Gadget.isRoot
    node context, gadgets.get key

node = generic name: "node"

generic node,
  Type.isObject,
  ( Type.isType Gadget ),
  ( context, gadget ) ->
    HTML.div ( Attributes.make context, gadget ), [
      HTML.div class: "zone", data: at: "before", key: gadget.key
      HTML.div [ Render.label context, gadget ]
      HTML.div class: "zone", data: at: "after", key: gadget.key
    ]

generic node,
  Type.isObject,
  ( isContainer ),
  ( context, gadget ) ->
    HTML.div ( Attributes.make context, gadget ), [
      HTML.div class: "zone", data: at: "before", key: gadget.key
      HTML.div class: "zone", data: parent: gadget.key, [ 
        Render.label context, gadget 
      ]
      HTML.div class: "zone", data: at: "after", key: gadget.key
    ]


generic node,
  Type.isObject,
  ( hasContent ),
  ( context, gadget ) ->
    open = gadget.key in context.open
    HTML.div ( Attributes.make context, gadget ), [
      HTML.div class: "zone", data: at: "before", key: gadget.key
      HTML.details { open }, [
        HTML.summary  class: "zone", data: parent: gadget.key,
          [ Render.label context, gadget ]
        HTML.div subtree context, gadget.content
      ]
      HTML.div class: "zone", data: at: "after", key: gadget.key
    ]

export default tree
export { tree }