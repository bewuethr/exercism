module PhoneNumber
  def self.clean(n)
    n.gsub(/\D/, "").sub(/^1/, "")[/^([^01]\d\d){2}\d{4}$/]
  end
end
