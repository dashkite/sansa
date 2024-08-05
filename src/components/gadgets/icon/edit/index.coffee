import * as Meta from "@dashkite/joy/metaclass"
import * as Rio from "@dashkite/rio"

import * as K from "@dashkite/katana/async"

import Gadget from "#helpers/component/gadget"

import { normalize, denormalize, search } from "./helpers"
import html from "./html"
import css from "./css"

class extends Rio.Handle
  Meta.mixin @, [
    Rio.tag "sansa-edit-icon"
    Gadget.editor { normalize, denormalize, html, css }

    Rio.initialize [
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

      ]
    ]
  ]
