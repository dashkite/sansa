import HTML from "@dashkite/html-render"

editor = ({ selected, editor }) ->
  if editor?
    HTML.tag "sansa-#{ editor.action }-gadget",
      data: 
        type: editor.type
        key: selected
      exportparts: "L1:L2, L2:L3, L3:L4"

export default editor
export { editor }