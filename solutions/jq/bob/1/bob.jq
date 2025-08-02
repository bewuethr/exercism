def isQuestion: test("\\?[[:blank:]]*$");
def isYelled: test("[[:alpha:]]") and . == ascii_upcase;
def isSilence: test("^[[:space:]]*$");

.heyBob
| if isQuestion and isYelled then "Calm down, I know what I'm doing!"
  elif isQuestion then "Sure."
  elif isYelled then "Whoa, chill out!"
  elif isSilence then "Fine. Be that way!"
  else "Whatever."
  end
