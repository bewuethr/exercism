def encode:
  [ match("(.)(\\1)*"; "g") ]
  | map(
    .string[:1] as $c
    | .string | length as $l
    | if $l > 1 then $l | tostring + $c
      else $c
      end
  )
  | join("");

def decode:
  [ capture("(?<count>\\d*)(?<char>[^\\d])"; "g") ]
  | map(
      if .count == "" then .count |= "1" else . end
      | .char * (.count | tonumber)
    )
  | join("");
