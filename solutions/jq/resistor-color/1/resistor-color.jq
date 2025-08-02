["black", "brown", "red", "orange", "yellow",
  "green", "blue", "violet", "grey", "white"] as $map
| if .property == "colors" then $map
  else
    .input.color as $color
    | $map | index($color)
  end
