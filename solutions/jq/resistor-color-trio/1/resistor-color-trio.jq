def col2num:
  {
    "black": 0,
    "brown": 1,
    "red": 2,
    "orange": 3,
    "yellow": 4,
    "green": 5,
    "blue": 6,
    "violet": 7,
    "grey": 8,
    "white": 9
  }[.];

.colors
| "\(.[0] | col2num)\(.[1] | col2num)\(.[2] | col2num * "0" // "")"
| tonumber
| if (. > 1000000000) then
    {value: (. / 1000000000), unit: "gigaohms"}
  elif (. > 1000000) then
    {value: (. / 1000000), unit: "megaohms"}
  elif (. > 1000) then
    {value: (. / 1000), unit: "kiloohms"}
  else
    {value: ., unit: "ohms"}
  end
