module ETL
  def self.transform(input)
    input.each_with_object({}) { |(num, chars), new| chars.each { |c| new[c.downcase] = num } }
  end
end
