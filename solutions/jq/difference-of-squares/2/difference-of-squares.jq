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
| { squareOfSum: sq_of_sum,
    sumOfSquares: sum_of_sq,
    differenceOfSquares: sq_of_sum - sum_of_sq
  }[$p]
