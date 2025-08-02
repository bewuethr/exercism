if (.strand1 | length) != (.strand2 | length)
then "strands must be of equal length\n" | halt_error
else .  end
| [.[]]
| map(explode) as $s
| [range(.[0] | length)]
| map(select($s[0][.] != $s[1][.]))
| length
