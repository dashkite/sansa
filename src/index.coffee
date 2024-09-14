import "@dashkite/vellum"

import "./components/connect"
import "./components/sites"
import "./components/site"
import "./components/gadget"
import "./components/gadgets/layout"
import "./components/gadgets/page"
import "./components/gadgets/text"
import "./components/gadgets/icon"
import "./components/gadgets/link"
import "./components/gadgets/navigation"
import "./components/gadgets/image"
import "./components/gadgets/variant"
import "./components/image/select"
import "./components/icon/select"

import Registry from "@dashkite/helium"
import { Gadgets } from "@dashkite/talisa"

import observe from "#helpers/observe"

# TODO find another way to do this
unwrap = ( state ) ->
  { state..., gadgets: state?.gadgets?.data }

State =

  get: ( name ) ->
    if ( item = localStorage.getItem name )?
      JSON.parse item
    else {}

  set: ( name, value ) ->
    if value?
      localStorage.setItem name, JSON.stringify value
    else
      localStorage.removeItem name

do ->
  state = State.get "sansa.editor.state"
  observable = observe state
  observe observable, ( state ) -> 
    State.set "sansa.editor.state", unwrap state
  Registry.set sansa: editor: state: observable
