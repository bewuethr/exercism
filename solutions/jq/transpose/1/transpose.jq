.lines
| map(. / "")
| transpose
| map(
    until(.[-1]; . = .[:-1])
    | map(. // " ")
    | join("")
  )
