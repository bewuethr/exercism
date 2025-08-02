.phrase
| gsub("-"; " ")
| gsub("[[:punct:]]"; "")
| [scan("\\b[^ ]"; "g")]
| join("")
| ascii_upcase
