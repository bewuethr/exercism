.moment
| if (test("T") | not) then
    . + "T00:00:00Z"
  elif (test("Z") | not) then
    . + "Z"
  else .
  end
| fromdate
|. + 1e9
| strftime("%FT%T")
