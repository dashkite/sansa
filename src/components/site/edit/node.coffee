import { generic } from "@dashkite/joy/generic"
import * as Type  from "@dashkite/joy/type"
import * as Pred from "@dashkite/joy/predicate"
import HTML from "@dashkite/html-render"

import Icons from "./icons"

drawer = HTML.el "vellum-drawer"

isPage = ({ type }) -> type == "page"
isLayout = ({ type }) -> type == "layout"
isNavigation = ({ type }) -> type == "navigation"

isContainer = Pred.any [ isPage, isLayout, isNavigation ]

node = generic name: "node"

generic node, 
  Type.isObject,
  Type.isArray,
  ({ type, name }, content ) ->
    drawer [
      HTML.div slot: "label", "data-state": "open", [
        HTML.i class: "ri-#{ Icons.open }"
        HTML.i class: "ri-#{ Icons[ type ] }"
        HTML.input name: "name", type: "text", value: name
      ]
      HTML.div slot: "label", "data-state": "closed", [
        HTML.i class: "ri-#{ Icons.closed }"
        HTML.i class: "ri-#{ Icons[ type ] }"
        HTML.input name: "name", type: "text", value: name
      ]
      HTML.div slot: "content", content
    ]

generic node,
  Type.isObject,
  ({ type, name }) ->
    HTML.div [
      HTML.i class: "ri-#{ Icons[ type ] }"
      HTML.input name: "name", type: "text", value: name
    ]

export default node