def nomore:
  if .  == 0 then "no more" else . | tostring end;

def plural:
  if . == 1 then "" else "s" end;

def capitalize_first:
  . / "" | .[0] |= ascii_upcase | join("");

def line1:
  "\(. | nomore | capitalize_first) bottle\(. | plural) of beer on the wall,"
    + " \(. | nomore) bottle\(. | plural) of beer.";

def line2:
  (if . == 0 then "it" else "one" end) as $oneit
  | if . == -1 then
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    else
      "Take \($oneit) down and pass it around,"
        + " \(. | nomore) bottle\(. | plural) of beer on the wall."
    end;

[range(.startBottles; .startBottles - .takeDown; -1)]
| map([(. | line1), (. - 1 | line2), ""])
| flatten
| .[:-1]
