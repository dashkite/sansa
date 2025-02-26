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

import * as Posh from "@dashkite/posh"

import { Site } from "@dashkite/aldera"

import configuration from "#configuration"
{ origin } = configuration

import html from "./html"
import pending from "#templates/pending"
import css from "./css"

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

  start @, ->
    @state = await Site.Add.resolve { origin }

  activate @, ->
    @html = html data: {}, errors: {}
    for await value from @state.start()
      # TODO save the corresponding resource
      #      based on the address coming back
      # TODO API should be returning a 201
      # TODO do this automatically when API returns a 201
      continue
    return

  # TODO do we want to stop in this case?
  #      we need to wait for the post request
  deactivate @, -> @state.stop()

  # TODO need to provide non-Rio Router functions
  click @, "[href='#cancel']", Router.back

  submit @, -> @dispatch "success"

  start @, ->
    for await errors from validate @root
      @html = html { data: DOM.form @root, errors }
      