class Templates
  
  @make: ( _import ) ->
    Object.assign ( new @ ), 
      import: _import

  add: ( names ) ->
    @templates = {}
    self = @
    await Promise.all do ->
      for name in names
        do ( name ) ->
          self.templates[ name ] = await self.import name
    @
  
  apply: ( name, args ) ->
    @templates[ name ]
      .apply null, args    

export default Templates