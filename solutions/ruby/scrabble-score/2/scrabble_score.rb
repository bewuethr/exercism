class Scrabble
  SCORE_MAP = {
    %w[A E I O U L N R S T] => 1,
    %w[D G] => 2,
    %w[B C M P] => 3,
    %w[F H V W Y] => 4,
    %w[K] => 5,
    %w[J X] => 8,
    %w[Q Z] => 10
  }
  def initialize(word)
    @word = word.upcase
    @scores = SCORE_MAP.map do |kv|
      kv[0].map { |c| {c => kv[1]} }.reduce(&:merge)
    end.reduce(&:merge)
  end

  def score
    @word.chars.reduce(0) { |sum, char| sum + @scores[char] }
  end
end
