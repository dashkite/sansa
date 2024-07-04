import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import "@dashkite/vellum"
import * as Site from "@dashkite/sites-resource"
import node from "./node"
import icon from "./icons"

isContainer = ({ type }) ->
  switch type
    when "page", "navigation", "layout"
      true
    else
      false

tree = ({ tree, selected, renaming }) ->
  for { key, name, type, content } in Object.values tree
    console.log { key, name, type, content }
    if content?
      node {
        data: { key }
        name
        type
        selected: key == selected
        renaming: key == renaming
        content: tree { roots: content, selected, renaming }
      }
    else
      node {
        data: { key }
        name
        type
        selected: key == selected
        renaming: key == renaming
      }

action = ({ name, label, disabled }) ->
  disabled ?= false
  HTML.button
    disabled: disabled
    name: name
    [
      icon name
      HTML.span label
    ]

actions = ({ tree, selected }) ->
  HTML.nav do ->
    if selected?
      if isContainer Site.lookup tree, selected
        [
          action name: "add", label: "Add"
          action name: "delete", label: "Delete"
        ]
      else
        [
          action name: "add", label: "Add", disabled: true
          action name: "delete", label: "Delete"
        ]

    else 
      [
        action name: "add", label: "Add"
        action name: "delete", label: "Delete", disabled: true
      ]
  
template = ({ site, selected, renaming }) ->

  sizes = site.preferences?.sizes ? [ 25, 50, 25 ]
  { tree } = site

  HTML.render [

    HTML.header part: "header", [
      HTML.div [
        HTML.h1 site.name
        HTML.p site.description
      ]
    ]

    HTML.main [
      HTML.tag "vellum-splitter", data: sizes: "#{ JSON.stringify sizes }", [
        HTML.div slot: "navigator", [
          actions { tree, selected }
          tree { tree, selected, renaming } 
        ]
        HTML.div slot: "preview", []
        HTML.div slot: "editor", []
      ]
    ]
  ]

export default template