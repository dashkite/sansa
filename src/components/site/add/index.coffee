import * as DOM from "@dashkite/dominator"
import * as W from "@dashkite/wayland"

import { Site } from "@dashkite/aldera"
import validate from "@dashkite/validator"
import * as Posh from "@dashkite/posh"


import configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import pending from "#templates/pending"
import css from "./css"

class extends W.Handle

  @mixins [

    W.tag "sansa-add-site"

    W.shadow

    W.diff

    W.sheets [ 
      css
      Posh.component
      Posh.forms
      Posh.animations
      Posh.icons
    ]

    # TODO use activate/modify state machine?
    W.activate ->
      @render html data: {}, errors: {}
      @state = await Site.Add.resolve { origin }
      # the Site.Add component yields the added site
      # as a value and exitsco
      for await value from @state.listen()
        @dispatch "success"

    # TODO do we want to stop in this case?
    #      we need to wait for the post request
    W.deactivate -> @state.close()

    W.click "[href='#cancel']", -> history.back()

    W.submit ( data ) -> @state[ "add site" ] data

    # TODO create validate mixin
    #      see below
    W.start ->
      for await errors from validate @root
        @render html { data: ( DOM.form @root ), errors }

  ]

# Validate Mixin
#
# Usage:
#
# validate ( errors ) ->
#   @render html { data: ( DOM.form @root ), errors }    
#
# Implementation:
#
# validate = add "invalid", ( T ) ->
#   start T, ->
#     for await errors from validate @root
#       @channel.send "invalid"
