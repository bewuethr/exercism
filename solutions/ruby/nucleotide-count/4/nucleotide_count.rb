class Nucleotide
  attr_reader :histogram

  def initialize(sequence)
    raise ArgumentError if sequence.match?(/[^ACGT]/)

    @histogram = sequence.chars.tally({"A" => 0, "C" => 0, "G" => 0, "T" => 0})
  end

  def self.from_dna(sequence)
    new(sequence)
  end

  def count(char)
    @histogram[char]
  end
end
