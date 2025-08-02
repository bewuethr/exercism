def sieve($idx):
    .[$idx] as $p
    | .[:($idx+1)] + (
        .[($idx+1):]
        | map(select(. % $p != 0))
      )
    | if length == 0 or pow(.[$idx]; 2) > .[-1] then . else sieve($idx+1) end;

def primes:
  length as $l
  | if $l >= $n then
      .[$n-1]
    else
      [range(2; pow(.[-1; 2))]
      | sieve(0)
      | primes
    end
    ;

if $n == 0 then
  "there is no zeroth prime" | halt_error
else
  [range(2; 2 * $n)]
  | sieve(0)
  | primes
end
