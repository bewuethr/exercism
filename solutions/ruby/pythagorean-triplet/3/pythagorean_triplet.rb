module PythagoreanTriplet
  def self.triplets_with_sum(n)
    result = []
    (2..(n / 3)).each do |a|
      (a + 1..(n + a) / 2).each do |b|
        c = n - b - a
        next unless c > b
        result << [a, b, c] if a**2 + b**2 == c**2
      end
    end

    result
  end
end
