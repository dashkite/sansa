import Registry from "@dashkite/registry"
import Messages from "@dashkite/messages"
import data from "./data"

do ->
  messages = await Registry.get "messages"
  # TODO allow application to supersede messages
  messages.add data
