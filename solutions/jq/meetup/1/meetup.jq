def is_teenth:
  strptime("%F")
  | mktime
  | strftime("%-d")
  | tonumber
  # | debug
  | . >= 13 and . <= 19
  ;

def to_idx:
  {
    "first": 0,
    "second": 1,
    "third": 2,
    "fourth": 3
  }[.]
  ;

. as $in
| [range(1; 32)]
| map(
  "\($in.year)-\($in.month)-\(.)"
  | strptime("%F")
  | mktime
  | strftime("%Y-%-m-%-d")
  | select(startswith("\($in.year)-\($in.month)"))
  | strptime("%F")
  | mktime
  | {"date": strftime("%F"), "day": strftime("%A") }
)
| if $in.week == "teenth" then
    map(select((.date | is_teenth) and .day == $in.dayofweek))[0].date
  elif ["first", "second", "third", "fourth"] | index($in.week) then
    map(select(.day == $in.dayofweek))
    | nth($in.week | to_idx).date
  elif $in.week == "last" then
    map(select(.day == $in.dayofweek))
    | last.date
  else
    halt_error("invalid value \($in.dayofweek) for dayofweek")
  end
