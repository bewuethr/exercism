def die($msg):
  $msg | halt_error
  ;

.phrase
| gsub("[[:blank:]+.()-]"; "")
| if length < 10 then
    die("must not be fewer than 10 digits")
  end
| if length == 11 then
    if startswith("1") | not then
      die("11 digits must start with 1")
    else
      ltrimstr("1")
    end
  end
| if length > 11 then
    die("must not be greater than 11 digits")
  end
| if test("[[:alpha:]]") then
    die("letters not permitted")
  end
| if test("[[:punct:]]") then
    die("punctuations not permitted")
  end
| if .[:1] == "0" then
    die("area code cannot start with zero")
  end
| if .[:1] == "1" then
    die("area code cannot start with one")
  end
| if .[3:4] == "0" then
    die("exchange code cannot start with zero")
  end
| if .[3:4] == "1" then
    die("exchange code cannot start with one")
  end
