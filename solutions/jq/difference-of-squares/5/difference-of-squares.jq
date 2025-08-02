def sq_of_sums:
  add | pow(.; 2);

def sum_of_sq:
  map(pow(.; 2)) | add;

.property as $prop
| [range(1; .input.number + 1)]
| { squareOfSum: sq_of_sums,
    sumOfSquares: sum_of_sq,
    differenceOfSquares: sq_of_sums - sum_of_sq
  }[$prop]
