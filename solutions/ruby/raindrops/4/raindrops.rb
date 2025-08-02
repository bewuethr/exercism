module Raindrops
  def self.convert(n)
    s = ""
    [["Pling", 3], ["Plang", 5], ["Plong", 7]].each { s += _1[0] if n % _1[1] == 0 }
    s.empty? ? n.to_s : s
  end
end
