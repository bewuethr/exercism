module Transpose
  def self.transpose(input)
    lines = input.lines.map(&:chomp)
    max_len = lines.map(&:length).max

    lines.map do |line|
      line.chars + [nil] * (max_len - line.length)
    end.transpose.map do |arr|
      arr.pop until arr.last
      arr.map { |el| el.nil? ? " " : el }.join
    end.join("\n")
  end
end
