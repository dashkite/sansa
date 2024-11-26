import * as Fn from "@dashkite/joy/function"
import "./select-color-input"
import "./select-color"
import "./select-family"
import "./select-gradient"
import "./select-image"
import "./select-intensity"
import "./select-scheme"
import Registry from "./registry"

Events = 
  initialize: Fn.pipe Object.values Registry
  
export default Events