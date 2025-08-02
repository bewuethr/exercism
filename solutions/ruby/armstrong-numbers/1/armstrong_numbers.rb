module ArmstrongNumbers
  def self.include?(number)
    number.digits.map { |d| d.pow(number.digits.length) }.sum == number
  end
end
