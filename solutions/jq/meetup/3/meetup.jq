# Extract day from date and check if in range 13..19
def is_teenth:
  strptime("%F")
  | mktime
  | strftime("%-d")
  | tonumber
  | . >= 13 and . <= 19
  ;

# Map English to index
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
# Generate dates from YYYY-MM-1 to YYYY-MM-31, do a roundtrip to a tm struct
# and back to convert things like 2023-2-30 to 2023-3-2, and then keep only
# days of the month of interest; do another roundtrip to get zero-padding, and
# convert to objects that include the weekday
| map(
  "\($in.year)-\($in.month)-\(.)"
  | strptime("%F")
  | mktime
  | strftime("%Y-%-m-%-d")
  | select(startswith("\($in.year)-\($in.month)"))
  | strptime("%F")
  | mktime
  | {"date": strftime("%F"), "day": strftime("%A")}
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
