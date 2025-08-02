.strand
| if test("[^ACGT]") then
    "Invalid nucleotide in strand" | halt_error
  else .
  end
| reduce (. / "")[] as $el ({"A":0,"C":0,"G":0,"T":0}; .[$el] += 1)
