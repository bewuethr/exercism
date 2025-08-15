def find_factors($n; $candidate; $factors):
  if $candidate * $candidate > $n then
    if $n > 1 then
      $factors + [$n]
    else
      $factors
    end
  elif $n % $candidate == 0 then
    find_factors($n / $candidate; $candidate; $factors + [$candidate])
  else
    find_factors($n; $candidate + 1; $factors)
  end
  ;

if .value <= 1 then
  []
else
  find_factors(.value; 2; [])
end
