if .series == "" then
  "series cannot be empty" | halt_error
elif .sliceLength > (.series | length) then
  "slice length cannot be greater than series length" | halt_error
elif .sliceLength == 0 then
 "slice length cannot be zero" | halt_error
elif .sliceLength < 0 then
  "slice length cannot be negative" | halt_error
else .
end
| .series as $s
| .sliceLength as $l
| [range(0; ($s | length) - $l + 1)]
| map($s[.:.+$l])
