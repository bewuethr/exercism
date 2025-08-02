module Luhn
  def self.valid?(str)
    str.delete!(" ")

    if str.match?(/[^[:digit:]]/) || str.length <= 1
      return false
    end

    str.reverse.chars.map(&:to_i).map.with_index do |n, idx|
      if idx.even?
        n
      else
        dbl = 2 * n
        (dbl > 9) ? (dbl - 9) : dbl
      end
    end.sum.modulo(10).zero?
  end
end
