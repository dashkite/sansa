import * as Type from "@dashkite/joy/type"
import HTML from "@dashkite/domo"
import Format from "@dashkite/format-text"
import { Gadget } from "@dashkite/talisa"

colors = ({ name, title, hint }, value, data, { mode }) ->

  HTML.tag "sansa-select-colors",
    name: name
    value: value
    data: { mode }
    exportparts: "L1:L2, L2:L3, L3:L4"

export { colors }