import HTML from "@dashkite/html-render"

template = ({ internal, branch }) ->

  console.log { internal, branch }

  HTML.p "Hello from the tree component!"

export default template