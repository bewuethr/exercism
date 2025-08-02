def final($w):
  if ($w) then
    "And all for the want of a \($w)."
  else
    empty
  end;

def sentence($w1; $w2):
    "For want of a \($w1) the \($w2) was lost.";

.strings
| . as $words
| [range(length - 1)]
| map(sentence($words[.]; $words[. + 1])) + [final($words[0])]
