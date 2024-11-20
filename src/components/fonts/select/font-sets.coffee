import * as Font from "#helpers/fonts"

FontSets =

  currentSet: ( state ) -> Font.sets[ state.index ]
  
  absoluteIndex: ( index, state ) ->
    sets = FontSets.filter state
    target = sets[ index ]
    FontSets.findIndex target, Font.sets

  relativeIndex: ( state, sets ) ->
    target = Font.sets[ state.index ]
    sets ?= FontSets.filter state
    FontSets.findIndex target, sets

  filter: ({ index, pinned, filters }) ->
    target = Font.sets[ index ]
    Font.sets.filter ( set ) ->
      ( FontSets.hasTags filters, set ) &&
      ( !pinned.base || ( set.base == target.base )) &&
        ( !pinned.heading || ( set.heading == target.heading )) &&
        ( !pinned.copy || ( set.copy == target.copy ))

  findIndex: ( target, sets ) ->
    sets.findIndex ( set ) ->
      ( set.heading == target.heading ) &&
        ( set.copy == target.copy ) &&
          ( set.base == target.base )

  tags: ( sets ) ->
    sets ?= Font.sets
    tags = {}
    for set in sets
      for key, value of set
        for tag in Font.db[ value ].tags
          tags[ tag ] ?= new Set
          tags[ tag ].add value
    for tag, fonts of tags
      if fonts.size > 5
        tags[ tag ] = fonts.size
      else
        delete tags[ tag ]
    Object.keys tags

  hasTags: ( filter, set ) ->
    Object
      .entries filter
      .filter ([ tag, enabled ]) -> enabled
      .map ([ tag ]) -> tag
      .every ( tag ) -> FontSets.hasTag tag, set

  hasTag: ( tag, set ) ->
    Object
      .values set
      .map ( name ) -> Font.db[ name ]
      .some ( font ) -> tag in font.tags

    
export default FontSets