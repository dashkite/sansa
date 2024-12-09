# This will go away once we move the association logic into
# a policy that operates on the Outseta profile

import * as Fn from "@dashkite/joy/function"
import * as Time from "@dashkite/joy/time"
import * as K from "@dashkite/katana/async"
import * as Rio from "@dashkite/rio"
import Profile from "@dashkite/rio-profile"
import HTTP from "@dashkite/rio-vega"

# TODO remove
#      this will go away once we get the address from the API
#      this is not intended as the basis for a reusable browser
#      hashing interface...

hash = ( value ) ->
  encoder = new TextEncoder
  raw = await crypto.subtle.digest "SHA-256", encoder.encode value
  bytes = Array.from new Uint8Array raw
  bytes[...8]
    .map ( byte ) -> byte.toString 36
    .join ""
  
Updates =

  batch:
    add: {}
    save: {}

  each: ( name ) ->
    for value in Object.values Updates.batch[ name ]
      yield value
    Updates.batch[ name ] = {}

  add: Fn.curry ( name, value ) ->
    ( Updates.batch[ name ][ value.address ] = value ) if value?

do ->
  loop
    for value from Updates.each "save"
      console.log update: value
    await Time.sleep 5000

Site =

  add: Fn.flow [
    K.peek ( site ) -> 
      Object.assign site,
        address: await hash performance.now().toString()
        preferences:
          editor:
            sizes: [ 20, 55, 25 ]
        gadgets: []
    K.peek Updates.add "add"
    Profile.update Fn.tee ( profile, site ) ->
      profile.sites ?= []
      profile.sites.push site
  ]

  save: Fn.flow [
    Profile.update Fn.tee ( profile, updated ) ->
      profile.sites ?= []
      current = profile.sites.find ( target ) ->
        updated.address == target.address
      if current?
        Updates.add "save", 
          Object.assign current, updated
      else
        console.warn "No site with given address found"
  ]

  load: Fn.flow [
    # HTTP.get [
    #   HTTP.json [ K.push Fn.identity ]
    #   HTTP.failure [
    #     K.peek ( error ) -> console.log { error }
    #   ]
    # ]
    Profile.load
    K.poke ( profile, description ) ->
      if profile.sites?
        profile.sites.find ( site ) ->
          description.site == site.address
    K.peek ( site, description ) ->
      if !site?
        # TODO remove after testing
        # should be unreachable 
        throw new Error "site [ #{ description.name } ] not found"
  ]

  remove: Profile.update Fn.tee ( profile, description ) ->
    profile.sites = do ->
      profile.sites.filter ( target ) -> 
        target.address != description.site

export default Site
export { Site }