def sieve($idx):
    .[$idx] as $p
    | .[:($idx+1)] + (
        .[($idx+1):]
        | map(select(. % $p != 0))
      )
    | if ($idx < length-1) then sieve($idx+1) else . end;

[range(2; .limit+1)]
| sieve(0)
