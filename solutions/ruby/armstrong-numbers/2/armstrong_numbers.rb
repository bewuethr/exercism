module ArmstrongNumbers
  def self.include?(number)
    number.digits.sum { |d| d.pow(number.digits.length) } == number
  end
end
