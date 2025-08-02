module PythagoreanTriplet
  def self.triplets_with_sum(n)
    result = []
    (2..(n / 3)).each do |a|
      # warn("a: #{a}")
      num = 2 * a**2 - 2 * a * n + n**2
      den = 2 * (n - a)
      next unless num % den == 0

      c = num / den
      b = n - c - a
      next unless c > b && b > a
      result << [a, b, c]
    end

    result
  end
end
