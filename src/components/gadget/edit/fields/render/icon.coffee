import HTML from "@dashkite/html-render"
import * as Render from "@dashkite/rio-arriba/render"

icon = ( value, { gadget, state }) ->

  # TODO get these from the state somehow
  { term, options } = state.editor.data ? {}
  style = gadget["hints.style"]

  Render.field
    name: "icon"
    label: "Icon"
    hint: "The icon to display"
    type: "custom"
    html: HTML.div [

      HTML.div class: "preview", [
        HTML.i class: "ri-#{ value }-#{ style }"
      ]

      HTML.input name: "icon", type: "hidden", value: value

      HTML.tag "vellum-field",
        # name: "_.term"
        type: "custom"
        value: term
        [
          HTML.div slot: "input", [
            HTML.tag "vellum-autocomplete",
              name: "_.term"
              value: term
              data: state: if options? then "open" else "closed"
              if options?
                for option in options
                  HTML.div slot: "option", data: value: option.name, [
                    HTML.i class: "ri-#{ option.name }-#{ style }"
                    HTML.span Format.title option.name
                  ]
          ]
          HTML.span slot: "label", "Search Icons"
          HTML.span slot: "hint", "Search the icons from Remixicon"   

      ]
    ]


export { icon }