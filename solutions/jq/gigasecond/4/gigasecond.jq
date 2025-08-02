.moment
| (if (test("T")) then "%FT%T" else "%F" end) as $fmt
| strptime($fmt)
| mktime
|. + 1e9
| strftime("%FT%T")
