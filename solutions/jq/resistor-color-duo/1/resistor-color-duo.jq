["black", "brown", "red", "orange", "yellow",
  "green", "blue", "violet", "grey", "white"] as $map
| .colors[:2]
| map(. as $col | $map | index($col))
| join("")
| tonumber
