import Registry from "@dashkite/registry"
import Messages from "@dashkite/messages"
import data from "./data"

do ->
  messages = await Registry.get "messages"
  messages.add data
