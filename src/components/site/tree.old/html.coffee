import HTML from "@dashkite/domo"

template = ({ internal, branch }) ->

  console.log { internal, branch }

  HTML.p "Hello from the tree component!"

export default template