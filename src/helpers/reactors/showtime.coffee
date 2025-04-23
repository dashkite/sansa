import * as Fn from "@dashkite/joy/function"
import { show } from "./show"
import { inductor } from "./inductor"
import { toggle } from "./toggle"

showtime = Fn.bpipe [
  show
  inductor 
    on: "show"
    off: "hide"
    wait: 100 # ms
  toggle
]

export { showtime }