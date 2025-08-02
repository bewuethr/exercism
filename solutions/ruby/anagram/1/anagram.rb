class Anagram
  def initialize(word)
    @word = word.downcase
    @tally = @word.chars.tally
  end

  def match(candidates)
    candidates.select { |c| c.downcase != @word && c.downcase.chars.tally == @tally }
  end
end
