import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"

events = Rio.initialize [
  Rio.input "vellum-autocomplete", [
    K.peek ( event ) -> console.log input: event

  ]
]

export { events }