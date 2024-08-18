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
import "./components/image/select"

import Registry from "@dashkite/helium"
import observe from "#helpers/observe"

State =

  get: ( name ) ->
    if ( item = localStorage.getItem name )?
      JSON.parse item
    else {}

  set: ( name, value ) ->
    if value?
      localStorage.setItem "sansa.editor.state", JSON.stringify value
    else
      localStorage.removeItem "sansa.editor.state"

do ->
  state = State.get "sansa.editor.state"
  observable = observe state
  observe observable, ( state ) -> 
    State.set "sansa.editor.state", state
  await Registry.set sansa: editor: state: observable
