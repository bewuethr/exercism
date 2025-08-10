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
| .diagram / "\n"
| map(
    .[$offset:$offset + 2] / ""
    | map(to_plant)
  )
| flatten
