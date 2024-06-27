import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"
import "@dashkite/vellum"
import node from "./node"

pages = [
  key: "/"
  name: "Home"
  type: "page"
  content: [
    key: "/header"
    name: "Header"
    type: "layout"
    content: [
      key: "/header/logo"
      name: "Logo"
      type: "image"
    ]
  ]
]

tree = ({ roots, selected, renaming }) ->
  for { key, name, type, content } in roots
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

template = ({ site, selected, renaming }) ->

  sizes = site.preferences?.sizes ? [ 25, 50, 25 ]

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
          tree { roots: pages, selected, renaming } 
        ]
        HTML.div slot: "preview", []
        HTML.div slot: "editor", []
      ]
    ]
  ]

export default template