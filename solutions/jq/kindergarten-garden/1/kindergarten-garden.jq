def offsetify:
  .[:1]
  | explode
  | (first - ("A" | explode | first)) * 2
  ;

def to_plant:
  {
    G: "grass",
    C: "clover",
    R: "radishes",
    V: "violets"
  }[.]
  ;

(.student | offsetify) as $offset
| .diagram
| split("\n")
| map(
    .[$offset:$offset + 2]
    | split("")
    | map(to_plant)
  )
| flatten
