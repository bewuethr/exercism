.phrase
| ascii_downcase / ""
| map(select(test("[[:alpha:]]")))
| reduce .[] as $char ({}; .[$char] += 1)
| map_values(select(. != 1))
| length == 0
