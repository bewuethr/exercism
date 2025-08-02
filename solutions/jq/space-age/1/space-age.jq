def period:
  31557600 as $earth_year_seconds
  | {
    "Mercury": 0.2408467,
    "Venus": 0.61519726,
    "Earth": 1,
    "Mars": 1.8808158,
    "Jupiter": 11.862615,
    "Saturn": 29.447498,
    "Uranus": 84.016846,
    "Neptune": 164.79132
  }
  | with_entries(.value *= $earth_year_seconds);

def two_decimal: ((. * 100) | round) / 100;

period[.planet] as $p
| if ($p | not) then "not a planet" | halt_error else . end
| .seconds / $p | two_decimal
