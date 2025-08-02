def sq_of_sum:
  add
  | pow(.; 2)
  ;

def sum_of_sq:
  map(pow(.; 2))
  | add
  ;

.property as $p
| [range(1; .input.number + 1)]
| if $p == "squareOfSum" then sq_of_sum
  elif $p == "sumOfSquares" then sum_of_sq
  elif $p == "differenceOfSquares" then sq_of_sum - sum_of_sq
  end
