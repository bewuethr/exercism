.phrase
| ascii_downcase
| [ scan("[[:alpha:]]") ]
| reduce .[] as $char ({}; .[$char] += 1)
| map_values(select(. != 1))
| length == 0
