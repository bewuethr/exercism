def sq_of_sums:
  add | pow(.; 2);

def sum_of_sqs:
  map(pow(.; 2)) | add;

.property as $prop
| [range(1; .input.number + 1)]
| { squareOfSum: sq_of_sums,
    sumOfSquares: sum_of_sqs,
    differenceOfSquares: sq_of_sums - sum_of_sqs
  }[$prop]
