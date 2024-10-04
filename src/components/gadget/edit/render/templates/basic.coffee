import HTML from "@dashkite/html-render"
import Format from "@dashkite/format-text"

basic = ({ type, subtype, name, title, hint, disabled }, value ) ->
  HTML.tag "vellum-field",
    name: name
    type: type
    subtype: subtype
    required: required ? true
    disabled: disabled ? false
    value: value
    [
      HTML.span slot: "label", title ? Format.title name
      if hint? then HTML.span slot: "hint", hint
      HTML.span slot: "option", title ? Format.title name
    ]

export { basic }