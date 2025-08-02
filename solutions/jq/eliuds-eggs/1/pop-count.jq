# Produce the binary representation backwards, but order doesn't matter
def convert:
  .s += (.n % 2 | tostring)
  | .n = (.n / 2 | trunc)
  | if .n == 0 then .s else {s, n} | convert end
;

{ n: .number, s: "" }
| convert / ""
| map(select(. == "1"))
| length
