import HTML from "@dashkite/html-render"
import Templates from "./registry"

Templates

  .add "uploading file", ({ completion }) ->

    HTML.label [
      HTML.span "Uploading&hellip;"
      HTML.progress max: "100", value: completion
    ]

  .add "uploaded file", ({ url }) ->
    HTML.p "File uploaded sucessfully!"



      # HTML.div class: "progress-bar", [
      #   HTML.div style: "width: #{ completion }%"
      # ]
