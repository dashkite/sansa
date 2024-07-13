import { generic } from "@dashkite/joy/generic"
import * as Type  from "@dashkite/joy/type"
import * as Obj from "@dashkite/joy/object"
import * as Pred from "@dashkite/joy/predicate"
import HTML from "@dashkite/html-render"
import { Gadget, Gadgets } from "@dashkite/talisa"

import icon from "#helpers/icons"

drawer = HTML.el "vellum-drawer"

Attributes =

  make: ({ selected, state }, { key }) ->
    class: if selected == key then "node selected" else "node"
    slot: "label"
    data: { key, state }

  open: ( context, gadget ) ->
    Attributes.make { context..., state: "open" }, gadget

  closed: ( context, gadget ) ->
    Attributes.make { context..., state: "closed" }, gadget

Render =

  input: ({ name }) ->
    HTML.input 
      name: "name"
      type: "text"
      value: name

  label: ({ renaming }, { type, key, label, name }) ->
    name ?= "Untitled #{ type }"
    [
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

tree = ({ gadgets, selected, renaming }) ->
  for gadget in gadgets when Gadget.isRoot gadget
    node { gadgets, selected, renaming }, gadget

node = generic name: "node"

generic node,
  Type.isObject,
  Type.isObject,
  ( context, gadget ) ->
    HTML.div ( Attributes.make context, gadget ),
      Render.label context, gadget

generic node,
  Type.isObject,
  ( Obj.has "content" ),
  ( context, gadget ) ->
    drawer [
      # TODO focus seems to only work for open state?
      HTML.div ( Attributes.closed context, gadget ), [
        icon "closed"
        ( Render.label context, gadget )...
      ]
      HTML.div ( Attributes.open context, gadget ), [
        icon "open"
        ( Render.label context, gadget )...
      ]
      HTML.div slot: "content", subtree context, gadget.content
    ]

export default tree
export { tree }