fileUpload = ( talos, { context: { file, handle }}) ->
  handle.dispatch "change", image: url: URL.createObjectURL file
  talos.context.state.update Fn.tee ( state ) ->
    state.name = name
    state.title = Format.title name

export { fileUpload }