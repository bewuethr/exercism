def find_factors:
  if .candidate * .candidate > .n then
    if .n > 1 then
      .factors + [.n]
    else
      .factors
    end
  elif .n % .candidate == 0 then
    .n /= .candidate
    | .factors += [.candidate]
    | find_factors
  else
    .candidate +=1
    | find_factors
  end
  ;

{
  n: .value,
  candidate: 2,
  factors: []
}
| find_factors
