def steps:
  if . < 1 then "Only positive integers are allowed" | halt_error
  else .
  end
  | if type != "array" then [.]
    else .
    end
  | if last == 1 then length - 1
    elif last % 2 == 0 then . + [last / 2] | steps
    else . + [(last * 3) + 1] | steps
    end
;
