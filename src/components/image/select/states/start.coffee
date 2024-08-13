import HTML from "@dashkite/html-render"

State =

  render: ->
    HTML.nav [
      HTML.button type: "button", name: "browse", "Browse images"
      HTML.button type: "button", name: "provide-url", "Provide a Web URL"
    ]

  links:

    "provide-url": ({ state }) ->
      title: "Web Image"
      name: "provide-url"
      back: state

    "browse": ({ state }) ->
      title: "Browse&hellip;"
      name: "browse"
      back: state

export default State