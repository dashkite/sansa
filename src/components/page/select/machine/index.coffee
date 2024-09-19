import Europa from "@dashkite/europa"

import transitions from "./transitions"
import states from "./states"

machine = Europa.make { name: "select page", states, transitions }

export default machine