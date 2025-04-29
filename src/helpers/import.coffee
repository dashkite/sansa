
Import =

  resolve: ( dictionary ) ->
    await Promise.all do ->
      for key, promise of dictionary
        do ( key, promise ) -> 
          dictionary[ key ] = ( await promise )?.default
    dictionary

export default Import