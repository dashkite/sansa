Profile = 

  save: ( profile ) ->
    localStorage.setItem "profile", JSON.stringify profile

  get: ( context ) -> 
    profile = JSON.parse localStorage.getItem "profile"
    { context..., profile }

  connected: ( context ) ->
    ( localStorage.getItem "profile" )?


export default Profile
export { Profile }