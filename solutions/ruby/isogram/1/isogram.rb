module Isogram
  def self.isogram?(input)
    input.empty? || input.gsub(/[- ]/, "").downcase.chars.tally.values.max == 1
  end
end
