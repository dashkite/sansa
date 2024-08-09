import HTML from "@dashkite/html-render"

State =

  render: ->
    HTML.nav [
      HTML.a href: "#browse", "Browse images"
      HTML.a href: "#provide-url", "Provide a Web URL"
    ]

  links:

    "provide-url": ( state ) ->
      name: "provide-url"
      back: state

export default State