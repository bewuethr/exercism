.moment
| if (test("T")) then
    strptime("%FT%T")
  else
    strptime("%F")
  end
| mktime
|. + 1e9
| strftime("%FT%T")
