import combinations from "./combinations"

Fonts = []

for base, subsets of combinations
  for heading, pairings of subsets
    for copy in pairings
      Fonts.push { heading, copy, base }

Fonts.sort ( a, b ) ->
  _a = "#{ a.base } / #{ a.heading } / #{ a.copy }".toLowerCase()
  _b = "#{ b.base } / #{ b.heading } / #{ b.copy }".toLowerCase()
  if _a == _b then 0 else if _a > _b then 1 else if _b > _a then -1

export default Fonts