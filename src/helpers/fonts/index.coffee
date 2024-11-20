import _sets from "./sets"
import db from "./db"

sets = []

for base, subsets of _sets
  for heading, pairings of subsets
    for copy in pairings
      sets.push { heading, copy, base }

sets.sort ( a, b ) ->
  _a = "#{ a.base } / #{ a.heading } / #{ a.copy }".toLowerCase()
  _b = "#{ b.base } / #{ b.heading } / #{ b.copy }".toLowerCase()
  if _a == _b then 0 else if _a > _b then 1 else if _b > _a then -1


export { sets, db }