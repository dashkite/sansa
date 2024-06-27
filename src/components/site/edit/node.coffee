import { generic } from "@dashkite/joy/generic"
import * as Type  from "@dashkite/joy/type"
import * as Obj from "@dashkite/joy/object"
import * as Pred from "@dashkite/joy/predicate"
import HTML from "@dashkite/html-render"

import Icons from "./icons"

drawer = HTML.el "vellum-drawer"

Attributes =

  make: ({ selected, data }) ->
    class: if selected then "node selected" else "node"
    slot: "label"
    data: data

  open: ({ description..., data }) ->
    Attributes.make { description..., data: { data..., state: "open" }}

  closed: ({ description..., data }) ->
    Attributes.make { description..., data: { data..., state: "closed" }}

Render =

  input: ({ name }) ->
    HTML.input 
      name: "name"
      type: "text"
      value: name

  label: ( description ) ->
    [
      HTML.i class: "ri-#{ Icons[ description.type ] }"
      if description.renaming
        Render.input description
      else
        HTML.span description.name
    ]
  

node = generic name: "node"

generic node,
  Type.isObject
  ( description ) ->
    HTML.div ( Attributes.make description ),
      Render.label description


generic node, 
  Obj.has "content"
  ( description  ) ->
    drawer [
      # TODO focus seems to only work for open state?
      HTML.div ( Attributes.closed description ), [
        HTML.i class: "ri-#{ Icons.closed }"
        ( Render.label description )...
      ]
      HTML.div ( Attributes.open description ), [
        HTML.i class: "ri-#{ Icons.open }"
        ( Render.label description )...
      ]
      HTML.div slot: "content", description.content
    ]

export default node