def is_anagram($w):
  ($w | ascii_downcase) as $a
  | (. | ascii_downcase) as $b
  | $a != $b and (($a / "" | sort) == ($b / "" | sort));

.subject as $s
| .candidates
| map(select(is_anagram($s)))
