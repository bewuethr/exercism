class SimpleCalculator
  class UnsupportedOperation < StandardError
  end

  ALLOWED_OPERATIONS = ["+", "/", "*"].freeze

  def self.calculate(first_operand, second_operand, operation)
    unless [first_operand, second_operand].all? { |operand| operand.is_a? Numeric }
      raise ArgumentError.new("Non-numeric operand")
    end

    unless ALLOWED_OPERATIONS.include? operation
      raise UnsupportedOperation.new("Unsupported operation #{operation}")
    end

    case operation
    when "+"
      "#{first_operand} + #{second_operand} = #{first_operand + second_operand}"
    when "/"
      "#{first_operand} / #{second_operand} = #{first_operand / second_operand}"
    when "*"
      "#{first_operand} * #{second_operand} = #{first_operand * second_operand}"
    end
  rescue ZeroDivisionError
    "Division by zero is not allowed."
  end
end
