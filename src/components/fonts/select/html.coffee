import * as Type from "@dashkite/joy/type"
import * as Text from "@dashkite/joy/text"
import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"
import { icon } from "#helpers/icons"
import FontSets from "./font-sets"

font = ( name ) ->
  HTML.a href: "https://fonts.google.com/specimen/#{ name }", 
    HTML.strong style: "font-family: #{ name };", name

pin = ( name, state ) ->
  action = if state.pinned[ name ] then "unpin" else "pin"
  HTML.button { name, data: { action }}, [
    icon action
    HTML.span Format.title action
  ]

template = ( state ) ->

  sets = FontSets.filter state
  { heading, copy, base } = FontSets.currentSet state
  index = FontSets.relativeIndex state, sets

  Tags =
    all: FontSets.tags()
    enabled: FontSets.tags sets


  HTML.main [

    HTML.input
      name: "index"
      type: "range"
      value: index
      min: 0
      max: sets.length - 1

    HTML.div class: "pins", [

      HTML.div [
        HTML.span "Base&nbsp;"
        font base
        pin "base", state
      ]

      HTML.div [
        HTML.span "Heading&nbsp;"
        font heading
        pin "heading", state
      ]
    
      HTML.div [
        HTML.span "Copy&nbsp;"
        font copy
        pin "copy", state
      ]

    ]

    HTML.div class: "filters", [

      HTML.header part: "L2", [
        HTML.h2 "Tags"
      ]

      HTML.div do ->
        for tag in Tags.all
          HTML.label [
            HTML.input
              name: tag
              type: "checkbox"
              disabled: !( tag in Tags.enabled )
            HTML.span Format.title tag
          ]
    ]


  ]
  


export default template 