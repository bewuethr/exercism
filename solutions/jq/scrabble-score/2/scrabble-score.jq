({
  "AEIOULNRST": 1,
  "DG": 2,
  "BCMP": 3,
  "FHVWY": 4,
  "K": 5,
  "JX": 8,
  "QZ": 10
}
| to_entries
| map({((.key / "")[]): .value})
| add) as $score
| .word
| ascii_upcase / ""
| map($score[.])
| add // 0
