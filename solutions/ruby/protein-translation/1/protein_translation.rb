InvalidCodonError = Class.new(StandardError)

module Translation
  STOP_CODONES = Set["UAA", "UAG", "UGA"]
  CODON_MAP = {
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UGG" => "Tryptophan"
  }
  
  def self.of_rna(strand)
    codones = strand.scan(/.../)
    stopIdx = codones.find_index { |c| STOP_CODONES.include?(c) }
    raise InvalidCodonError unless stopIdx || strand.length % 3 == 0

    codones = codones.slice(...stopIdx) if stopIdx
    raise InvalidCodonError unless codones.all? { CODON_MAP.has_key?(_1) }
    
    codones.map { CODON_MAP[_1] }
  end
end