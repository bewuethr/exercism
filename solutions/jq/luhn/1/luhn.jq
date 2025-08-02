gsub("[[:blank:]]+"; "")
| if test("[^[:digit:]]") or length <= 1 then
    false
  else
    . / ""
    | reverse
    | [., [range(0; length)]]
    | transpose
    | map(
        {idx: .[1], val: .[0] | tonumber}
        | if .idx % 2 == 1 then
            .val |= (2 * .) as $d | if $d > 9 then $d - 9 else $d end
          else
            .
          end
        | .val
    )
    | add
    | . % 10 == 0
  end
