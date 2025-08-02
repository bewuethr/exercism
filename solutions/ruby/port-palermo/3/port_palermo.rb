module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[...4].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    if %w[OIL GAS].include?(ship_identifier[...3])
      :A
    else
      :B
    end
  end
end
