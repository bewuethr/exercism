.sentence
| ascii_downcase / ""
| map(select(test("[[:alpha:]]")))
| unique
| length == 26
