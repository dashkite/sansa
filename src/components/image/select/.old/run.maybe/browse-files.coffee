 ({ state, event, handle }) ->
      target = event.target.closest "button"
      target.nextSibling.click()
      state