import Fonts from "#helpers/fonts"

FontSets =

  absoluteIndex: ( index, state ) ->
    sets = FontSets.filter state
    target = sets[ index ]
    FontSets.findIndex target, Fonts

  relativeIndex: ( state, sets ) ->
    target = Fonts[ state.index ]
    sets ?= FontSets.filter state
    FontSets.findIndex target, sets

  filter: ({ index, pinned }) ->
    target = Fonts[ index ]
    Fonts.filter ( set ) ->
      ( !pinned.base || ( set.base == target.base )) &&
        ( !pinned.heading || ( set.heading == target.heading )) &&
        ( !pinned.copy || ( set.copy == target.copy ))

  findIndex: ( target, sets ) ->
    sets.findIndex ( set ) ->
      ( set.heading == target.heading ) &&
        ( set.copy == target.copy ) &&
          ( set.base == target.base )

export default FontSets