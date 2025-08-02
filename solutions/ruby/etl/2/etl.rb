module ETL
  def self.transform(input)
    input.each_with_object({}) { |(n, chars), new| chars.each { |c| new[c.downcase] = n } }
  end
end
