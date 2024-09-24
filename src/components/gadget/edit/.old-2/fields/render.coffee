import Generic from "@dashkite/generic"
import HTML from "@dashkite/html-render"
import Schema from "./schema"

render = Generic.make "Fields.render"

  # first, some error conditions

  # missing schema

  .define [ undefined, Object ], 
    ( _, { gadget }) ->
      console.warn "gadget.edit:
        missing schema for 
        [ #{ gadget.type } ]"

  .define [ undefined, Obj.has "subtype" ], 
    ( _, { gadget }) ->
      console.warn "gadget.edit:
        missing schema for 
        [ #{ gadget.type } ]
        [ #{ gadget.subtype } ]"

  # we got a value, but it's not an object or array
  .define [ ( -> true ), Object ], 
    ( _, { gadget }) ->
      console.warn "gadget.edit:
        invalid schema for [ #{ gadget.type } ],
        expecting object or array"

  # this is ultimately where we want to get to
  # just render the fields listed in the schema
  .define [ Array, Object ],
    ( fields, context ) ->
      for key in fields
        Field.render key, context
      
  # object schema is a subschema
  .define [ Object, Object ],
    ( subschemas, context ) ->
      render subschemas[ gadget.subtype ], context

  # starting point, we just have the context...
  .define [ Object ],
    ({ context..., gadget }) ->
      render Schema[ gadget.type ], { context..., gadget }

export { render }