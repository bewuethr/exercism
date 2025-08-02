module Pangram
  ALPHABET_LEN = 26
  def self.pangram?(sentence)
    sentence.downcase.scan(/[[:alpha:]]/).tally.length == ALPHABET_LEN
  end
end
