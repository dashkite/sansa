import DOM from "@dashkite/dominator"
import {
  Handle
  tag
  shadow
  diff
  sheets
  start
  activate
  deactivate 
  click
  submit
} from "@dashkite/wayland"

import { Site } from "@dashkite/aldera"
import validate from "@dashkite/validator"
import * as Posh from "@dashkite/posh"


import configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import pending from "#templates/pending"
import css from "./css"

Router = back: -> history.back()

class extends Handle

  tag @, "sansa-add-site"

  shadow @

  diff @

  sheets @, [ 
    css
    Posh.component
    Posh.forms
    Posh.animations
    Posh.icons
  ]

  activate @, ->
    @render html data: {}, errors: {}
    @state = await Site.Add.resolve { origin }
    # the Site.Add component yields the added site
    # as a value and exitsco
    for await value from @state.start()
      @dispatch "success"

  # TODO do we want to stop in this case?
  #      we need to wait for the post request
  deactivate @, -> @state.stop()

  # TODO need to provide non-Rio Router functions
  click @, "[href='#cancel']", Router.back

  submit @, ( data ) -> @state[ "add site" ] data

  start @, ->
    # TODO why does the validation not worK?
    #      ex: we get no error for omitting name/title
    for await errors from validate @root
      @render html { data: ( DOM.form @root ), errors }



#   validate @, ( errors ) ->
#     @render html { data: ( DOM.form @root ), errors }    

# validate = add "invalid", ( T ) ->
#   start T, ->
#     for await errors from validate @root
#       @channel.send "invalid"
