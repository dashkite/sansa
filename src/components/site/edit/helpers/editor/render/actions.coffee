import HTML from "@dashkite/html-render"
import icon from "#helpers/icons"

action = ({ name, label, disabled }) ->
  disabled ?= false
  HTML.button
    disabled: disabled
    name: name
    [
      icon name
      HTML.span label
    ]

actions = ({ gadgets, selected }) ->
  HTML.nav do ->
    if selected? && ( gadget = gadgets.get selected )?
      [
        action name: "add gadget", label: "Add"
        action name: "remove gadget", label: "Delete"
      ]
    else 
      [
        action name: "add gadget", label: "Add"
        action name: "remove gadget", label: "Delete", disabled: true
      ]
  

export { actions }
export default actions