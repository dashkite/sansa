import * as Type from "@dashkite/joy/type"
import * as Text from "@dashkite/joy/text"
import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"
import families from "@dashkite/talisa-render/families"

import { icon } from "#helpers/icons"


import "https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.18.0/cdn/components/color-picker/color-picker.js"

# Interesting color picker alternatives:
# - https://codepen.io/tiggr/pen/xEYyLR
# - https://codepen.io/thykka/pen/WRELda
# - https://codepen.io/graphilla/pen/NpaXNm
# - https://codepen.io/adnenrebai/pen/bapWER

template = ( state ) ->

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
              selected: state.source == "from-color"
              "From Color"
            HTML.span 
              slot: "tab"
              name: "from-image"
              selected: state.source == "from-image"
              "From Image"
            HTML.div
              slot: "panel"
              name: "from-image"
              selected: state.source == "from-image"
              HTML.tag "sansa-select-image",
                name: "image"
                exportparts: "L1:L2, L2:L3, L3:L4"
            HTML.div
              slot: "panel"
              name: "from-color"
              selected: state.source == "from-color"
              HTML.tag "sl-color-picker",
                inline: true
                "no-format-toggle": true
                value: state.color
          ]
      ]

    # HTML.tag "vellum-field",
    #   name: "family"
    #   type: "range"
    #   value: families.indexOf state.family
    #   [
    #     HTML.label slot: "label", "Family"
    #     HTML.span slot: "hint",
    #       "Choose the color family, ex: pastels or earth tones"
    #     HTML.datalist slot: "options", id: "family-list", do ->
    #       for family, index in families
    #         HTML.option value: index, label: Format.title family
    #   ]    

    HTML.tag "vellum-field",
      name: "intensity"
      type: "range"
      value: state.intensity
      minimum: "0"
      maximum: "1"
      step: "0.01"
      [
        HTML.label slot: "label", "Intensity"
        HTML.span slot: "hint",
          "Choose the degree you want color to be noticeable"
      ]    

    HTML.tag "vellum-field",
      name: "background"
      type: "range"
      value: state.background
      minimum: "0"
      maximum: "1"
      step: "0.01"
      [
        HTML.label slot: "label", "Background"
        HTML.span slot: "hint",
          "Choose how colorful you want the background to be,
          ranging from black to a dark hue of your start color"
      ]    

    HTML.tag "vellum-field",
      name: "gradient"
      type: "range"
      value: state.gradient
      minimum: "0"
      maximum: "1"
      step: "0.01"
      [
        HTML.label slot: "label", "Gradient"
        HTML.span slot: "hint",
          "Choose the degree you want to use gradients in place
            of discrete colors"
      ]    



  ]
  


export default template 