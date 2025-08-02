def is_anagram($w):
  [$w, .] | map(ascii_downcase) as [$a, $b]
  | $a != $b and (($a / "" | sort) == ($b / "" | sort));

.subject as $s
| .candidates
| map(select(is_anagram($s)))
