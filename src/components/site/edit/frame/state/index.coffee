import { Gadgets } from "@dashkite/talisa"
import empty from "./empty"

wrap = ({ state..., gadgets }) ->
  { 
    state...
    gadgets: Gadgets.from gadgets 
  }

unwrap = ({ state..., gadgets }) ->
  {
    state...
    gadgets: gadgets.data
  }

export { wrap, unwrap, empty }