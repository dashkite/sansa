import { generic } from "@dashkite/joy/generic"
import * as Type  from "@dashkite/joy/type"
import * as Obj from "@dashkite/joy/object"
import * as Pred from "@dashkite/joy/predicate"
import HTML from "@dashkite/html-render"
import { Gadget, Gadgets } from "@dashkite/talisa"

import icon from "#helpers/icons"

# drawer = HTML.el "vellum-drawer"

Attributes =

  make: ({ selected, open }, { key }) ->
    class:
      if selected == key
        "selected node"
      else "node"
    open: open
    data: { key }

Render =

  input: ({ name }) ->
    HTML.input 
      name: "name"
      type: "text"
      value: name

  label: ({ renaming }, { type, key, label, name }) ->
    name ?= "Untitled #{ type }"
    HTML.label [
      icon type
      if renaming == key
        Render.input { name }
      else
        HTML.span name
    ]
  
subtree = generic name: "subtree"

generic subtree,
  Type.isObject,
  Type.isObject,
  ( context, content ) ->
    # TODO support slots
    for name, gadgets of content
      HTML.div class: "slot", data: { name }, 
        subtree context, gadgets

generic subtree,
  Type.isObject
  Type.isArray
  ( context, content ) ->
    for key in content
      node context, Gadgets.find key, context.gadgets 

tree = ( context ) ->
  for gadget in context.gadgets when Gadget.isRoot gadget
    node context, gadget

node = generic name: "node"

generic node,
  Type.isObject,
  Type.isObject,
  ( context, gadget ) ->
    HTML.div ( Attributes.make context, gadget ),
      HTML.div [ Render.label context, gadget ]

generic node,
  Type.isObject,
  ( Obj.has "content" ),
  ( context, gadget ) ->
    open = gadget.key in context.open
    HTML.details ( Attributes.make { context..., open }, gadget ), [
      HTML.summary [ Render.label context, gadget ]
      HTML.div subtree context, gadget.content
    ]

# generic node,
#   Type.isObject,
#   ( Obj.has "content" ),
#   ( context, gadget ) ->
#     drawer [
#       # TODO focus seems to only work for open state?
#       HTML.div ( Attributes.closed context, gadget ), [
#         icon "closed"
#         ( Render.label context, gadget )...
#       ]
#       HTML.div ( Attributes.open context, gadget ), [
#         icon "open"
#         ( Render.label context, gadget )...
#       ]
#       HTML.div slot: "content", subtree context, gadget.content
#     ]

export default tree
export { tree }