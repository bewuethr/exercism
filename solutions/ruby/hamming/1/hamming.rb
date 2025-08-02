module Hamming
  def self.compute(str_a, str_b)
    raise ArgumentError if str_a.length != str_b.length

    str_a.chars.map.with_index { |c, idx| c != str_b[idx] }.count(true)
  end
end
