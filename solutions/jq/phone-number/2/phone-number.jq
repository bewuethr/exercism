def die($msg):
  $msg | halt_error
  ;

def require(condition; reason):
  if condition | not then
    die(reason)
  end
  ;

.phrase
| gsub("[[:blank:]+.()-]"; "")
| require(length >= 10; "must not be fewer than 10 digits")
| if length == 11 then
    require(startswith("1"); "11 digits must start with 1")
    | .[1:]
  end
| require(length <= 11; "must not be greater than 11 digits")
| require(test("[[:alpha:]]") | not; "letters not permitted")
| require(test("[[:punct:]]") | not; "punctuations not permitted")
| require(.[:1] != "0"; "area code cannot start with zero")
| require(.[:1] != "1"; "area code cannot start with one")
| require(.[3:4] != "0"; "exchange code cannot start with zero")
| require(.[3:4] != "1"; "exchange code cannot start with one")
