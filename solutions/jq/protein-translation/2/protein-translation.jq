def die:
  "Invalid codon"
  | halt_error;

def to_amino_acid:
  {
    "AUG": "Methionine",
    "UUU": "Phenylalanine",
    "UUC": "Phenylalanine",
    "UUA": "Leucine",
    "UUG": "Leucine",
    "UCU": "Serine",
    "UCC": "Serine",
    "UCA": "Serine",
    "UCG": "Serine",
    "UAU": "Tyrosine",
    "UAC": "Tyrosine",
    "UGU": "Cysteine",
    "UGC": "Cysteine",
    "UGG": "Tryptophan"
  }[.] // die;

# Find the index of the first stop codon
def stopidx:
  # Non-null for any stop codon
  map(. as $s | ["UAA", "UAG", "UGA"] | index($s)) as $a
  # Indices of all non-null elements
  | [range($a | length) | select($a[.])]
  | first;

.strand
| length as $l
| [scan("...")]
| stopidx as $idx
| if ($idx | not and $l % 3 != 0) then die else . end
| . = .[:$idx]
| map(to_amino_acid)
