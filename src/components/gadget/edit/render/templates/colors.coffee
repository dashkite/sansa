import * as Type from "@dashkite/joy/type"
import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"

colors = ({ name, title, hint }, value ) ->

  HTML.tag "sansa-select-colors",
    value: value
    exportparts: "L1:L2, L2:L3, L3:L4"

export { colors }