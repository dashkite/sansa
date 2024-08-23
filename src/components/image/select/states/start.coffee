import HTML from "@dashkite/html-render"

State =

  render: ->
    HTML.nav [
      HTML.label [
        HTML.button type: "button", name: "browse-files",  "Files"
        HTML.input name: "path", type: "file", accept: "image/*"
      ]
      HTML.button type: "button", name: "browse-gadgets", "Gadgets"
      HTML.button type: "button", name: "browse-unsplash", "Unsplash"
      HTML.button type: "button", name: "provide-url", "Web URL"
    ]

  links:

    "provide-url": ({ state }) ->
      title: "Web Image"
      name: "provide-url"
      back: state

    "browse-files": ({ state, event, handle }) ->
      target = event.target.closest "button"
      target.nextSibling.click()
      state

    "uploading": ({ state, event, handle }) ->
      handle.dispatch "change", 
        image: url: URL.createObjectURL event.target.files[0]
      title: "Browse Files"
      name: "uploading"
      back: state

    "browse-gadgets": ({ state }) ->
      title: "Browse Image Gadgets"
      name: "browse-gadgets"
      back: state

    "browse-unsplash": ({ state }) ->
      title: "Browse Unsplash Images"
      name: "browse-unsplash"
      back: state

export default State