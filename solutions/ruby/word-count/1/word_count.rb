class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @phrase.gsub(/[^[:alnum:][:digit:]']/, " ").gsub(/^'|'$| '|' /, " ").downcase.split.tally
  end
end
