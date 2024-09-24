import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"

page = ( key, specifier, { gadget }) ->

  HTML.tag "vellum-field",
      name: key
      label: specifier.title ? Format.title key
      hint: "A Page of your site"
      [

        HTML.div if value?
          [
            icon "page"
            HTML.span value
          ]
        else
          [ HTML.span "No page selected" ]

        HTML.tag "sansa-select-page"
          attributes:
            name: "page"
            exportparts: "L1:L2, L2:L3, L3:L4"

      ]

export { page }