import * as Type from "@dashkite/joy/type"
import * as Text from "@dashkite/joy/text"
import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"
import families from "@dashkite/talisa-render/families"

import { icon } from "#helpers/icons"

template = ( state ) ->

  HTML.main [

    HTML.tag "vellum-field",
      # TODO change this to `hue`
      name: "color"   
      [
        HTML.label slot: "label", "Hue"
        HTML.span slot: "hint",
          "Select the hue which will form the starting point
            for generating a color palette"
        HTML.div slot: "input", 
          HTML.input
            type: "range"
            value: state.color
            min: "0"
            max: "360"
      ]

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