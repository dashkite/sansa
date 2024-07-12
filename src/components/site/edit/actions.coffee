Actions = 

  add: ( context ) ->
    context.action = "add gadget"
    
  delete: ( context ) ->
    context.action = "remove gadget"

export default Actions
export { Actions }