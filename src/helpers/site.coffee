# This will go away once we move the association logic into
# a policy that operates on the Outseta profile

import * as Fn from "@dashkite/joy/function"
import * as Rio from "@dashkite/rio"
import Profile from "@dashkite/rio-profile"

Site =

  save: Profile.update Fn.tee ( profile, site ) ->
    profile.sites ?= []
    profile.sites.push site.address

  remove: Profile.update Fn.tee ( profile, description ) ->
    profile.sites = do ->
      profile.sites.filter ( address ) -> 
        address == description.address

export default Site
export { Site }