import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"
import * as Editor from "./editor"

class extends Rio.Handle

  Meta.mixin @, [

    Rio.tag "sansa-edit-gadget"
    Rio.diff

    Editor.initialize
    Editor.events
    Editor.connect
  ]