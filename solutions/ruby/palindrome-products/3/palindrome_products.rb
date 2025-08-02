class Palindromes
  PalindromeProduct = Struct.new(:value, :factors)

  def initialize(max_factor:, min_factor: 1)
    @range = [*min_factor..max_factor]
  end

  def generate
    @products = {}
    @range.repeated_combination(2).each do |a, b|
      prod = a * b
      (@products[prod] ||= []) << [a, b] if prod.to_s == prod.to_s.reverse
    end
  end

  def largest
    max = @products.keys.max
    PalindromeProduct.new(value: max, factors: @products[max])
  end

  def smallest
    max = @products.keys.min
    PalindromeProduct.new(value: max, factors: @products[max])
  end
end
