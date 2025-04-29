import Registry from "@dashkite/registry"

# an oddball version of empty that first checks if the value
# is defined
empty = ( array ) -> !( array? && array.length > 0 )

export { empty }