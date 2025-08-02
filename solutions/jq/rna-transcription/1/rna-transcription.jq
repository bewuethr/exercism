def toRna:
  {
    "G": "C",
    "C": "G",
    "T": "A",
    "A": "U"
  } as $map
  | . / ""
  | map($map[.])
  | add // ""
  ;
