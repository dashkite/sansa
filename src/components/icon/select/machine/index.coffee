import Europa from "@dashkite/europa"

import transitions from "./transitions"
import states from "./states"

machine = Europa.make { name: "select icon", states, transitions }

export default machine