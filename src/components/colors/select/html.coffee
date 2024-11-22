import * as Type from "@dashkite/joy/type"
import * as Text from "@dashkite/joy/text"
import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"
import { icon } from "#helpers/icons"

template = ( state ) ->
  console.log name

  HTML.main [

    HTML.tag "vellum-field",
      name: "color"
      [
        HTML.label slot: "label", "Start Color"
        HTML.span slot: "hint",
          "Select a color which will form the starting point
            for generating a color palette"
        HTML.div slot: "input", 
          HTML.tag "vellum-tabs", [
            HTML.span 
              slot: "tab"
              name: "from-color", 
              "From Color"
            HTML.span 
              slot: "tab"
              name: "from-image"
              "From Image"
            HTML.div
              slot: "panel"
              name: "from-image"
              HTML.tag "sansa-select-image",
                name: "image"
                exportparts: "L1:L2, L2:L3, L3:L4"
            HTML.div
              slot: "panel"
              name: "from-color"
              HTML.input 
                type: "color"
                value: state.color
          ]
      ]

    HTML.tag "vellum-field",
      name: "family"
      type: "range"
      [
        HTML.label slot: "label", "Family"
        HTML.span slot: "hint",
          "Choose the color family, ex: pastels or earth tones"
      ]    

    HTML.tag "vellum-field",
      name: "intensity"
      type: "range"
      [
        HTML.label slot: "label", "Intensity"
        HTML.span slot: "hint",
          "Choose the degree you want color to be noticeable"
      ]    

    HTML.tag "vellum-field",
      name: "gradients"
      type: "range"
      [
        HTML.label slot: "label", "Gradients"
        HTML.span slot: "hint",
          "Choose the degree you want to use gradients in place
            of individual colors"
      ]    

    HTML.tag "vellum-field",
      name: "scheme"
      type: "range"
      [
        HTML.label slot: "label", "Scheme"
        HTML.span slot: "hint",
          "Choose the color scheme from variations
            generated from the other selections"
      ]    


  ]
  


export default template 