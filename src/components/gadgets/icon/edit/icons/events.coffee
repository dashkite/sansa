import * as Rio from "@dashkite/rio"
import * as K from "@dashkite/katana/async"

events = Rio.initialize [
  Rio.keyup "input[name='icon']", [
    K.peek ( event, handle ) ->
      switch event.code

        when "ArrowDown"
          selected = handle.root.querySelector ".selected"
          if selected?
            if ( target = selected.nextSibling )?
              selected.classList.remove "selected"
              target.classList.add "selected"
              target.scrollIntoView
                behavior: "smooth"
                block: "nearest"
          else
            selected = handle.root.querySelector ".suggestions > :first-child"
            selected.classList.add "selected"

        when "ArrowUp"
          selected = handle.root.querySelector ".selected"
          if selected?
            if ( target = selected.previousSibling )?
              selected.classList.remove "selected"
              target.classList.add "selected"
              target.scrollIntoView
                behavior: "smooth"
                block: "nearest"

        when "Escape"
          selected = handle.root.querySelector ".selected"
          if selected?
            selected.classList.remove "selected"

        when "Enter"
          selected = handle.root.querySelector ".selected"
          if selected?
            selected.classList.remove "selected"
            span = selected.querySelector "span"
            input = handle.root.querySelector "input[name='icon']"
            input.value = span.textContent
            input.dispatchEvent new Event "input", bubbles: true

  ]

  Rio.click ".suggestions > li", [
    K.peek ( event, handle ) ->
      selected = event.target.closest "li"
      selected.classList.add "selected"
      span = selected.querySelector "span"
      input = handle.root.querySelector "input[name='icon']"
      input.value = span.textContent
      input.dispatchEvent new Event "input", bubbles: true

  ]
]

export { events }