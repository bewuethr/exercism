def sieve($idx):
    .[$idx] as $p
    | .[:($idx+1)] + (
        .[($idx+1):]
        | map(select(. % $p != 0))
      )
    | if length == 0 or .[$idx] * 2 > .[-1] then . else sieve($idx+1) end;

[range(2; .limit+1)]
| sieve(0)
