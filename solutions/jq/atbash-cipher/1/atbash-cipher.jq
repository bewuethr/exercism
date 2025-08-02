def atbash:
  . as $in
  | "abcdefghijklmnopqrstuvwxyz" / ""
  | [., reverse]
  | transpose
  | map({(.[0]): .[1]})
  | add
  | .[$in] // $in
  ;

def encode:
  ascii_downcase
  | gsub("[^[:alnum:]]"; ""; "g")
  | . / ""
  | map(atbash)
  | join("")
  | gsub("(?<c>.{5})"; "\(.c) ")
  | rtrimstr(" ")
  ;

def decode:
  gsub(" "; "")
  | . / ""
  | map(atbash)
  | join("")
  ;


if .property == "encode" then
  .input.phrase | encode
elif .property == "decode" then
  .input.phrase | decode
else
  error("invalid operation \(.property)")
end
