.phrase
| gsub("-"; " ")
| gsub("[[:punct:]]"; "")
| [scan("\\b[^ ]"; "g")]
| join("")
| gsub("(?<a>.)"; "\(.a | ascii_upcase)")
