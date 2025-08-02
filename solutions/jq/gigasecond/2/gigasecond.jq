.moment
| if (test("T") | not) then
    . + "T00:00:00"
  else .
  end
| strptime("%FT%T")
| mktime
|. + 1e9
| strftime("%FT%T")
