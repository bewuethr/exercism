class Nucleotide
  def initialize(sequence)
    raise ArgumentError if sequence.match?(/[^ACGT]/)

    @histo = sequence.chars.tally({"A" => 0, "C" => 0, "G" => 0, "T" => 0})
  end

  def self.from_dna(sequence)
    new(sequence)
  end

  def count(char)
    @histo[char]
  end

  def histogram
    @histo
  end
end
