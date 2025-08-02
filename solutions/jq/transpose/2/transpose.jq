.lines
| map(. / "")
| transpose
| map(
    # Remove trailing nulls from each sub-array
    until(.[-1]; . = .[:-1])
    # Replace the remaining nulls with a blank
    | map(. // " ")
    | join("")
  )
