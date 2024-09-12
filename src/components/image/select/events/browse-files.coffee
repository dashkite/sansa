import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"
import { Event } from "@dashkite/rio-europa"

initialize = Rio.change "input[type='file']", [
  K.push ( event, handle ) ->
    file = event.target.files[0]
    url = URL.createObjectURL file
    handle.dom.value = url
    handle.dispatch "change", url
    { url }
  Event.make "file upload"
]

export default { initialize }
