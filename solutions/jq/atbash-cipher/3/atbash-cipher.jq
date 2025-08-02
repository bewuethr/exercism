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
  | gsub("[^[:alnum:]]"; "")
  | . / ""
  | map(atbash)
  | join("")
  | [scan(".{1,5}")]
  | join(" ")
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
