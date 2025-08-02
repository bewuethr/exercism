module Raindrops
  def self.convert(n)
    a = ""
    [["Pling", 3], ["Plang", 5], ["Plong", 7]].each { a += _1[0] if n % _1[1] == 0 }
    s.empty? ? n.to_s : s
  end
end
