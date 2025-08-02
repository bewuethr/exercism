def sieve($idx):
    .[$idx] as $p
    | .[:($idx+1)] + (
        .[($idx+1):]
        | map(select(. % $p != 0))
      )
    | if length == 0 or pow(.[$idx]; 2) > .[-1] then . else sieve($idx+1) end;

def primes:
  (.sieve | length) as $l
  | .upto as $upto
  | if $l >= $n then
      .sieve[$n-1]
    else
      [range(2; 2 * $upto)]
      | sieve(0)
      | {sieve: ., upto: (2 * $upto)}
      | primes
    end;

if $n == 0 then
  "there is no zeroth prime" | halt_error
else
  {sieve: [], upto: $n}
  | primes
end
