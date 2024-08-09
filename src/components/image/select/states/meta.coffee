State = 

  links:

    back: ( state ) -> 
      { state.back..., forward: state }

    forward: ( state ) -> state.forward

export default State